import 'package:muscle_track/features/home/data/dto/response/workout_response.dart';

abstract interface class HomeRepository {
  Future<WorkoutResponse> getSuggestedWorkouts();
}
