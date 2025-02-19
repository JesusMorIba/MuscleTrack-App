import 'package:flutter/material.dart';
import 'package:muscle_track/core/theme/app_colors.dart';

class CustomTabBar extends StatelessWidget {
  final bool isAnimationSelected;
  final VoidCallback onAnimationTap;
  final VoidCallback onVideoTap;

  const CustomTabBar({
    super.key,
    required this.isAnimationSelected,
    required this.onAnimationTap,
    required this.onVideoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onAnimationTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isAnimationSelected
                    ? AppColors.buttonPrimary
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Animation',
                style: TextStyle(
                  color: isAnimationSelected ? Colors.white : AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: onVideoTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isAnimationSelected
                    ? Colors.grey[300]
                    : AppColors.buttonPrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Video',
                style: TextStyle(
                  color: isAnimationSelected ? AppColors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
