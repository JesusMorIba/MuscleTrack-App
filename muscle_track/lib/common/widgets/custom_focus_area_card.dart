import 'package:flutter/material.dart';
import 'package:muscle_track/core/theme/app_colors.dart';
import 'package:muscle_track/core/theme/app_text_styles.dart';

class CustomFocusAreaCard extends StatelessWidget {
  final String title;
  final String image;

  const CustomFocusAreaCard({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: AppTextStyles.heading5(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
