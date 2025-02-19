import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/features/workout_detail/data/dto/response/workout_detail_response.dart';
import 'package:muscle_track/features/workout_detail/data/source/remote/workout_detail_api.dart';
import 'package:muscle_track/common/common.dart';
import 'package:muscle_track/features/workout_detail/data/repository/workout_detail_repository.dart';

final workoutDetailRepositoryProvider =
    Provider.autoDispose<WorkoutDetailRepository>((ref) {
  final workoutDetailApi = ref.watch(workoutDetailApiProvider);
  return WorkoutDetailRepositoryImpl(workoutDetailApi);
});

class WorkoutDetailRepositoryImpl
    with DioExceptionMapper
    implements WorkoutDetailRepository {
  final WorkoutDetailApi _workoutDetailApi;

  WorkoutDetailRepositoryImpl(this._workoutDetailApi);

  @override
  Future<WorkoutDetailResponse> getWorkoutDetailById(String workoutId) async {
    try {
      final response = await _workoutDetailApi.getWorkoutDetailById(workoutId);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message:
            "An unexpected error occurred. Please try again later".hardcoded,
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}
