import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/common/widgets/custom_picker.dart';
import 'package:muscle_track/core/theme/app_colors.dart';
import 'package:muscle_track/core/theme/app_text_styles.dart';
import 'package:muscle_track/features/complete_profile/presentation/provider/complete_profile_provider.dart';

class HeightStep extends ConsumerWidget {
  const HeightStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Enter Your Height",
            textAlign: TextAlign.center,
            style: AppTextStyles.heading3(color: AppColors.black),
          ),
          const SizedBox(height: 15),
          Text(
            "Please provide your height in centimeters.",
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyXLargeRegular(color: AppColors.grey700),
          ),
          const SizedBox(height: 15),
          CustomPicker(
            unit: "cm",
            minValue: 0,
            maxValue: 250,
            defaultValue: 185,
            onValueChanged: (value) {
              ref.watch(completeProfileProvider.notifier).updateHeight(value);
            },
          ),
        ],
      ),
    );
  }
}
