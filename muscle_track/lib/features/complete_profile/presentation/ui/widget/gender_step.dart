import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/core/theme/app_colors.dart';
import 'package:muscle_track/core/theme/app_text_styles.dart';
import 'package:muscle_track/features/complete_profile/presentation/provider/complete_profile_provider.dart';
import 'package:muscle_track/features/complete_profile/presentation/state/complete_profile_state.dart';

class GenderStep extends ConsumerWidget {
  const GenderStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gender = ref.watch(completeProfileProvider).gender;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Select Your Gender",
            textAlign: TextAlign.center,
            style: AppTextStyles.heading3(color: AppColors.black),
          ),
          const SizedBox(height: 15),
          Text(
            "Help us understand you better.",
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyXLargeRegular(color: AppColors.grey700),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  ref
                      .watch(completeProfileProvider.notifier)
                      .updateGender(Gender.man);
                },
                child: GenderCard(
                  imagePath: 'assets/images/man.png',
                  label: 'Man',
                  isSelected: gender == Gender.man,
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  ref
                      .watch(completeProfileProvider.notifier)
                      .updateGender(Gender.woman);
                },
                child: GenderCard(
                  imagePath: 'assets/images/woman.png',
                  label: 'Woman',
                  isSelected: gender == Gender.woman,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool isSelected;

  const GenderCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 150,
              height: 480,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: AppTextStyles.heading4(
              color: isSelected ? AppColors.primary : AppColors.black),
        ),
      ],
    );
  }
}
