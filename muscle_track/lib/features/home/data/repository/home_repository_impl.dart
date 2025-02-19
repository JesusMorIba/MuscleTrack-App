import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/common/common.dart';
import 'package:muscle_track/features/home/data/dto/response/workout_response.dart';
import 'package:muscle_track/features/home/data/repository/home_repository.dart';
import 'package:muscle_track/features/home/data/source/remote/home_api.dart';

final homeRepositoryProvider = Provider.autoDispose<HomeRepository>((ref) {
  final homeApi = ref.watch(homeApiProvider);

  return HomeRepositoryImpl(homeApi);
});

final class HomeRepositoryImpl
    with DioExceptionMapper
    implements HomeRepository {
  final HomeApi _homeApi;

  HomeRepositoryImpl(this._homeApi);

  @override
  Future<WorkoutResponse> getSuggestedWorkouts() async {
    try {
      final response = await _homeApi.getSuggestedWorkouts();

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
