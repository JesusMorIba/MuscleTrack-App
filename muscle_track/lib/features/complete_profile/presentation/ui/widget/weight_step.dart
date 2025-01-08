import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/common/widgets/custom_picker.dart';
import 'package:muscle_track/core/theme/app_colors.dart';
import 'package:muscle_track/core/theme/app_text_styles.dart';
import 'package:muscle_track/features/complete_profile/presentation/provider/complete_profile_provider.dart';

class WeightStep extends ConsumerWidget {
  const WeightStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Enter Your Weight",
            textAlign: TextAlign.center,
            style: AppTextStyles.heading3(color: AppColors.black),
          ),
          const SizedBox(height: 15),
          Text(
            "Please provide your weight in kilograms.",
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyXLargeRegular(color: AppColors.grey700),
          ),
          const SizedBox(height: 15),
          CustomPicker(
            unit: "kg",
            minValue: 0,
            maxValue: 300,
            defaultValue: 76,
            onValueChanged: (value) {
              ref.watch(completeProfileProvider.notifier).updateWeight(value);
            },
          ),
        ],
      ),
    );
  }
}
