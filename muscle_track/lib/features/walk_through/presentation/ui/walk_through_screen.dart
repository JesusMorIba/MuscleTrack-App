import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/core/core.dart';
import 'package:muscle_track/common/common.dart';
import 'package:muscle_track/features/walk_through/presentation/provider/walk_through_provider.dart';

class WalkThroughScreen extends ConsumerWidget {
  const WalkThroughScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final walkThroughState = ref.watch(walkThroughProvider);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CarouselSlider(
              items: _buildSlides(walkThroughState.sliders, size),
              carouselController: ref
                  .read(walkThroughProvider.notifier)
                  .carouselSliderController,
              options: CarouselOptions(
                height: size.height * 0.8,
                onPageChanged: (index, reason) {
                  ref
                      .read(walkThroughProvider.notifier)
                      .updateCurrentPage(index);
                },
                viewportFraction: 1.0,
                padEnds: false,
                clipBehavior: Clip.hardEdge,
                enableInfiniteScroll: false,
                scrollPhysics: const ClampingScrollPhysics(),
                autoPlay: false,
                initialPage: 0,
              ),
            ),
            _buildPageIndicators(
                walkThroughState.current, walkThroughState.sliders),
          ],
        ),
        bottomNavigationBar:
            _buildBottomBar(context, ref, walkThroughState.current),
      ),
    );
  }

  List<Widget> _buildSlides(List<Map<String, String>> slides, Size size) {
    return slides.map((slide) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              color: AppColors.primary,
              child: Image.asset(
                slide['image'].toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            slide['title'].toString(),
            textAlign: TextAlign.center,
            style: AppTextStyles.heading3(color: AppColors.black),
          ),
          SizedBox(height: size.width * 0.02),
          Text(
            slide['subtitle'].toString(),
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyXLargeRegular(color: AppColors.grey700),
          ),
        ],
      );
    }).toList();
  }

  Widget _buildPageIndicators(int current, List<Map<String, String>> slides) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: slides.asMap().entries.map((entry) {
        return Container(
          width: current == entry.key ? 32.0 : 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            color: current == entry.key ? AppColors.primary : AppColors.grey200,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomBar(BuildContext context, WidgetRef ref, int current) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.grey100, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          current < 2
              ? CustomElevatedButton(
                  text: 'Skip',
                  size: ButtonSize.medium,
                  buttonDesign: ButtonDesign.secondary,
                  onPressed: () {
                    ref.read(walkThroughProvider.notifier).onSkipPressed();
                  },
                )
              : const SizedBox.shrink(),
          CustomElevatedButton(
            text: 'Continue',
            size: current < 2 ? ButtonSize.medium : ButtonSize.large,
            buttonDesign: ButtonDesign.primary,
            onPressed: () {
              ref.read(walkThroughProvider.notifier).onContinuePressed();
            },
          ),
        ],
      ),
    );
  }
}
