import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:muscle_track/common/exception/failure.dart';
import 'package:muscle_track/features/workout_detail/data/repository/workout_detail_repository.dart';
import 'package:muscle_track/features/workout_detail/data/dto/response/workout_detail_response.dart';
import 'package:muscle_track/features/workout_detail/application/workout_detail_service.dart';
import 'package:muscle_track/features/workout_detail/data/repository/workout_detail_repository_impl.dart';

final workoutDetailServiceProvider =
    Provider.autoDispose<WorkoutDetailService>((ref) {
  final workoutDetailRepository = ref.watch(workoutDetailRepositoryProvider);

  return WorkoutDetailServiceImpl(workoutDetailRepository);
});

class WorkoutDetailServiceImpl implements WorkoutDetailService {
  final WorkoutDetailRepository _workoutDetailRepository;

  WorkoutDetailServiceImpl(this._workoutDetailRepository);

  @override
  Future<Result<WorkoutDetailResponse, Failure>> getWorkoutDetailById(
      String workoutId) async {
    try {
      final workoutDetail =
          await _workoutDetailRepository.getWorkoutDetailById(workoutId);

      return Success(workoutDetail);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(Failure(
        message: e.toString(),
        exception: e as Exception,
        stackTrace: s,
      ));
    }
  }
}
