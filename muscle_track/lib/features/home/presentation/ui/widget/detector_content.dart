import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:muscle_track/common/widgets/custom_detection_card.dart';
import 'package:muscle_track/core/core.dart';
import 'package:muscle_track/core/router/app_router_const.dart';
import 'package:muscle_track/features/home/presentation/provider/home_provider.dart';
import 'package:muscle_track/features/home/presentation/state/home_state.dart';
import 'package:muscle_track/features/pose_detector/data/source/local/exercise_type.dart';

class DetectorContent extends ConsumerWidget {
  DetectorContent({super.key});

  final List<Map<String, String>> exercises = [
    {
      "name": "Dead Lift",
      "image": "assets/images/dead_lift.png",
      "description":
          "The Deadlift targets the lower back, glutes, hamstrings, and core. It's essential to maintain a neutral spine throughout the movement to avoid injury and keep good posture."
    },
    {
      "name": "Squat",
      "image": "assets/images/squat.png",
      "description":
          "Squats are great for strengthening the lower body, working the quads, glutes, and hamstrings. Ensure proper depth, keep heels on the ground, and avoid letting knees pass over the toes."
    },
    {
      "name": "Bench Press",
      "image": "assets/images/bench_press.png",
      "description":
          "The Bench Press strengthens the chest, triceps, and shoulders. Focus on lowering the bar to your chest with proper technique and avoiding elbows going beyond 90 degrees."
    }
  ];

  final Map<String, ExerciseType> exerciseTypeMap = {
    "Dead Lift": ExerciseType.deadlift,
    "Squat": ExerciseType.squat,
    "Bench Press": ExerciseType.benchPress,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.event == HomeEvent.error) {
      return Center(child: Text('Error: ${state.error}'));
    }

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
            hintText: 'Search exercise...',
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
          "Select Exercise",
          style: AppTextStyles.heading5(),
        ),
        const SizedBox(height: 8),
        ...exercises.map((exercise) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              onTap: () {
                final selectedExerciseType =
                    exerciseTypeMap[exercise["name"]!] ?? ExerciseType.squat;

                context.pushNamed(
                  poseDetectorRoute,
                  pathParameters: {'exerciseType': selectedExerciseType.name},
                );
              },
              child: CustomDetectionCard(
                title: exercise["name"]!,
                description: exercise["description"]!,
                image: exercise["image"]!,
              ),
            ),
          );
        }),
      ],
    );
  }
}
