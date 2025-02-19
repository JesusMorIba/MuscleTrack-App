import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muscle_track/common/style/style.dart';
import 'package:muscle_track/core/core.dart';
import 'package:muscle_track/features/workout_detail/data/dto/response/workout_detail_response.dart';

class CustomExerciseCard extends StatelessWidget {
  final Exercise exercise;

  const CustomExerciseCard({
    super.key,
    required this.exercise,
  });

  String _formatDetails(Exercise exercise) {
    if (exercise.sets != null && exercise.repetitions != null) {
      return "${exercise.sets} sets x ${exercise.repetitions} reps";
    } else if (exercise.time != null && exercise.timeUnit != null) {
      return "${exercise.time} ${exercise.timeUnit}";
    } else if (exercise.repetitions != null) {
      return "${exercise.repetitions} reps";
    } else if (exercise.time != null) {
      return "${exercise.time} sec";
    } else {
      return "No details available";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/drag_handle.svg',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: kSmall),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: AppColors.grey50,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: exercise.exercise.imageUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: AppColors.red),
                ),
              ),
            ),
          ),
          const SizedBox(width: kMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.exercise.title,
                  style: AppTextStyles.heading5(),
                ),
                Text(
                  _formatDetails(exercise),
                  style:
                      AppTextStyles.bodyMediumRegular(color: AppColors.grey700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
