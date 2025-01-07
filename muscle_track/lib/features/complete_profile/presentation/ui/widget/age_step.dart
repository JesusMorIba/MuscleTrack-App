import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/common/widgets/custom_picker.dart';
import 'package:muscle_track/core/core.dart';
import 'package:muscle_track/features/complete_profile/presentation/provider/complete_profile_provider.dart';

class AgeStep extends ConsumerWidget {
  const AgeStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Enter Your Age ",
            textAlign: TextAlign.center,
            style: AppTextStyles.heading3(color: AppColors.black),
          ),
          const SizedBox(height: 15),
          Text(
            "Your age helps us design suitable workouts.",
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyXLargeRegular(color: AppColors.grey700),
          ),
          const SizedBox(height: 15),
          CustomPicker(
            unit: "years",
            minValue: 18,
            maxValue: 120,
            defaultValue: 27,
            onValueChanged: (value) {
              ref.watch(completeProfileProvider.notifier).updateAge(value);
            },
          ),
        ],
      ),
    );
  }
}
