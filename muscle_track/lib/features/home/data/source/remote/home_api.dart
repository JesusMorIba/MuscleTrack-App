import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/core/data/remote/endpoint.dart';
import 'package:muscle_track/core/data/remote/network_service.dart';
import 'package:muscle_track/features/home/data/dto/response/workout_response.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api.g.dart';

final homeApiProvider = Provider.autoDispose<HomeApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return HomeApi(dio);
});

@RestApi()
abstract class HomeApi {
  factory HomeApi(Dio dio) => _HomeApi(dio);

  @GET(workoutEndPoint)
  Future<WorkoutResponse> getSuggestedWorkouts();
}
