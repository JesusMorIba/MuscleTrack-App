import 'package:multiple_result/multiple_result.dart';
import 'package:muscle_track/common/exception/failure.dart';
import 'package:muscle_track/features/home/data/dto/response/workout_response.dart';

abstract interface class HomeService {
  Future<Result<WorkoutResponse, Failure>> getSuggestedWorkouts();
}
