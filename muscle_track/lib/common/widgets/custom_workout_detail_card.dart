import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muscle_track/core/core.dart';

class CustomWorkoutDetailCard extends StatelessWidget {
  final String icon;
  final String value;
  final String label;

  const CustomWorkoutDetailCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.grey50, width: 0.05),
      ),
      color: AppColors.white,
      child: Container(
        width: 120,
        height: 112,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              width: 24,
              height: 24,
              icon,
            ),
            const SizedBox(height: 3),
            Text(
              value,
              style: AppTextStyles.heading5(color: AppColors.black),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: AppTextStyles.bodyMediumMedium(color: AppColors.dark4),
            ),
          ],
        ),
      ),
    );
  }
}
