import 'package:muscle_track/features/workout_detail/data/dto/response/workout_detail_response.dart';

abstract interface class WorkoutDetailRepository {
  Future<WorkoutDetailResponse> getWorkoutDetailById(String workoutId);
}
