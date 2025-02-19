import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:muscle_track/common/common.dart';
import 'package:muscle_track/common/widgets/custom_exercise_card.dart';
import 'package:muscle_track/common/widgets/custom_workout_detail_card.dart';
import 'package:muscle_track/core/core.dart';
import 'package:muscle_track/core/router/app_router_const.dart';
import 'package:muscle_track/features/workout_detail/presentation/provider/workout_detail_provider.dart';
import 'package:muscle_track/features/workout_detail/presentation/state/workout_detail_state.dart';

class WorkoutDetailList extends ConsumerWidget {
  const WorkoutDetailList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workout = ref.watch(workoutDetailProvider);

    if (workout.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (workout.event == WorkoutDetailEvent.error) {
      return Center(
        child: Text(
          'Error: ${workout.error}',
          style: const TextStyle(fontSize: 18),
        ),
      );
    }

    if (workout.workoutDetailResponse == null) {
      return const Center(
        child: Text('No workout data available.'),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              CachedNetworkImage(
                imageUrl: workout.workoutDetailResponse!.workout.cover,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeCap: StrokeCap.round,
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error, color: AppColors.red),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workout.workoutDetailResponse!.workout.title,
                  style: AppTextStyles.heading3(),
                ),
                const SizedBox(height: 8),
                Text(
                  workout.workoutDetailResponse!.workout.description,
                  style:
                      AppTextStyles.bodyLargeRegular(color: AppColors.grey700),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // Opcional: espacio entre los widgets
                  children: [
                    Expanded(
                      child: CustomWorkoutDetailCard(
                        icon: 'assets/icons/person_run.svg',
                        value: workout
                            .workoutDetailResponse!.workout.exercises.length
                            .toString(),
                        label: 'workouts',
                      ),
                    ),
                    Expanded(
                      child: CustomWorkoutDetailCard(
                        icon: 'assets/icons/clock.svg',
                        value: workout.workoutDetailResponse!.workout.minutes
                            .toString(),
                        label: 'minutes',
                      ),
                    ),
                    Expanded(
                      child: CustomWorkoutDetailCard(
                        icon: 'assets/icons/kcal.svg',
                        value: workout.workoutDetailResponse!.workout.kcal
                            .toString(),
                        label: 'kcal',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount:
                  workout.workoutDetailResponse!.workout.exercises.length,
              itemBuilder: (context, index) {
                final exercise =
                    workout.workoutDetailResponse!.workout.exercises[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: CustomExerciseCard(
                    exercise: exercise,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomElevatedButton(
              onPressed: () {
                context.pushNamed(exerciseDetailRoute);
              },
              text: 'Start',
              size: ButtonSize.large,
            ),
          ),
        ],
      ),
    );
  }
}
