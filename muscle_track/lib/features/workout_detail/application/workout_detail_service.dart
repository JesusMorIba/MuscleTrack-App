import 'package:multiple_result/multiple_result.dart';
import 'package:muscle_track/common/exception/failure.dart';
import 'package:muscle_track/features/workout_detail/data/dto/response/workout_detail_response.dart';

abstract interface class WorkoutDetailService {
  Future<Result<WorkoutDetailResponse, Failure>> getWorkoutDetailById(
      String workoutId);
}
