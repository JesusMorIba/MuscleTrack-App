import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/core/data/remote/endpoint.dart';
import 'package:muscle_track/core/data/remote/network_service.dart';
import 'package:muscle_track/features/workout_detail/data/dto/response/workout_detail_response.dart'; // Nueva clase WorkoutDetailResponse
import 'package:retrofit/retrofit.dart';

part 'workout_detail_api.g.dart';

final workoutDetailApiProvider = Provider.autoDispose<WorkoutDetailApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return WorkoutDetailApi(dio);
});

@RestApi()
abstract class WorkoutDetailApi {
  factory WorkoutDetailApi(Dio dio) => _WorkoutDetailApi(dio);

  @GET(workoutDetailEndPoint)
  Future<WorkoutDetailResponse> getWorkoutDetailById(
    @Path("workoutId") String workoutId,
  );
}
