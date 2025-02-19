import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/core/theme/app_colors.dart';
import 'package:muscle_track/core/theme/app_text_styles.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ExerciseDetailScreen extends ConsumerWidget {
  const ExerciseDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up, color: Colors.black),
            onPressed: () {
              // Acción de sonido
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Get Ready!",
            style: AppTextStyles.heading3(color: AppColors.primary),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Push Up',
                style: AppTextStyles.heading4SemiBold(),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.info_outline,
                color: Colors.grey,
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 24),
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 8.0,
            percent: 1.0,
            center: Text(
              "2",
              style: AppTextStyles.heading2(),
            ),
            progressColor: AppColors.primary,
            backgroundColor: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }
}
