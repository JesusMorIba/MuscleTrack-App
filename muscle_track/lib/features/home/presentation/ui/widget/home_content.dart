import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muscle_track/common/common.dart';
import 'package:muscle_track/core/theme/app_colors.dart';
import 'package:muscle_track/core/theme/app_text_styles.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> workoutPlans = [
      {
        "title": "Full-Body HIIT Blast",
        "duration": "20 mins",
        "level": "Intermediate",
        "imageUrl": "daily_exercise_routine_qeyazq",
      },
      {
        "title": "Daily Exercise",
        "duration": "16 mins",
        "level": "Beginner",
        "imageUrl": "full_body_hiit_blast_mbol1j",
      },
    ];

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        TextField(
          decoration: InputDecoration(
            prefixIcon: Container(
              padding: const EdgeInsets.all(12),
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                fit: BoxFit.contain,
              ),
            ),
            hintText: 'Search workout plan...',
            hintStyle: AppTextStyles.bodyXLargeRegular(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColors.grey100,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Workout Plan For You",
          style: AppTextStyles.heading5(color: AppColors.black),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: workoutPlans.length,
          itemBuilder: (context, index) {
            final plan = workoutPlans[index];
            return Column(
              children: [
                CustomWorkoutCard(
                  title: plan["title"] ?? "Untitled",
                  duration: plan["duration"] ?? "Unknown",
                  level: plan["level"] ?? "Unknown",
                  imageId: plan["imageUrl"] ?? "",
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
        Text(
          "Body Focus Area",
          style: AppTextStyles.heading5(color: AppColors.black),
        ),
        const SizedBox(height: 8),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: const [
            CustomFocusAreaCard(
                title: "Shoulders", image: "assets/images/shoulders.png"),
            CustomFocusAreaCard(
                title: "Chest", image: "assets/images/chest.png"),
            CustomFocusAreaCard(title: "Arms", image: "assets/images/arms.png"),
            CustomFocusAreaCard(title: "Back", image: "assets/images/back.png"),
            CustomFocusAreaCard(
                title: "Stomach", image: "assets/images/stomach.png"),
            CustomFocusAreaCard(title: "Legs", image: "assets/images/legs.png"),
          ],
        ),
      ],
    );
  }
}
