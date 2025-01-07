import 'package:alert_info/alert_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:muscle_track/core/core.dart';
import 'package:muscle_track/common/common.dart';
import 'package:muscle_track/features/complete_profile/presentation/provider/complete_profile_provider.dart';
import 'package:muscle_track/features/complete_profile/presentation/ui/widget/activity_level_step.dart';
import 'package:muscle_track/features/complete_profile/presentation/ui/widget/age_step.dart';
import 'package:muscle_track/features/complete_profile/presentation/ui/widget/gender_step.dart';
import 'package:muscle_track/features/complete_profile/presentation/ui/widget/height_step.dart';
import 'package:muscle_track/features/complete_profile/presentation/ui/widget/weight_step.dart';
import 'package:muscle_track/features/login/presentation/provider/login_provider.dart';
import 'package:muscle_track/features/login/presentation/state/login_state.dart';

class CompleteProfileForm extends ConsumerWidget {
  const CompleteProfileForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(completeProfileProvider).currentPageIndex;
    const totalSteps = 10;

    ref.listen<LoginState>(loginProvider, (previous, next) {
      switch (next.event) {
        case LoginEvent.success:
          AlertInfo.show(
            context: context,
            text: 'Login success',
            typeInfo: TypeInfo.success,
          );
          context.go('/walkthrough');
          break;

        case LoginEvent.error:
          AlertInfo.show(
            context: context,
            text: next.error!,
            typeInfo: TypeInfo.error,
          );
          break;

        case LoginEvent.none:
          break;
      }

      if (next.event != LoginEvent.none) {
        ref.read(loginProvider.notifier).clearEvent();
      }
    });

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: (currentPage + 1) / totalSteps,
                          minHeight: 12,
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "${currentPage + 1}/$totalSteps",
                        style: AppTextStyles.heading5(color: AppColors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _completeProfileForm(context, ref),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context, ref),
      ),
    );
  }
}

Widget _completeProfileForm(BuildContext context, WidgetRef ref) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: PageView(
      controller: ref.watch(completeProfileProvider.notifier).pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        GenderStep(),
        AgeStep(),
        HeightStep(),
        WeightStep(),
        ActivityLevelStep(),
      ],
    ),
  );
}

Widget _buildBottomBar(BuildContext context, WidgetRef ref) {
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
        CustomElevatedButton(
          text: 'Skip',
          size: ButtonSize.medium,
          isLoading: ref.read(loginProvider).isLoading,
          buttonDesign: ButtonDesign.secondary,
          onPressed: () {
            ref.read(completeProfileProvider.notifier).onBackPressed();
          },
        ),
        CustomElevatedButton(
          text: 'Continue ',
          size: ButtonSize.medium,
          isLoading: ref.read(loginProvider).isLoading,
          buttonDesign: ButtonDesign.primary,
          onPressed: () {
            ref.read(completeProfileProvider.notifier).onContinuePressed();
          },
        ),
      ],
    ),
  );
}
