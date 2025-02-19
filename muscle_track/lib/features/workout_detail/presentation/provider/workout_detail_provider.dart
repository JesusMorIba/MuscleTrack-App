import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/features/workout_detail/application/workout_detail_service_impl.dart';
import 'package:muscle_track/features/workout_detail/presentation/state/workout_detail_state.dart';

//! 1 - StateNotifierProvider
final workoutDetailProvider =
    AutoDisposeNotifierProvider<WorkoutDetailNotifier, WorkoutDetailState>(
        (WorkoutDetailNotifier.new));

//! 2 - Notifier
class WorkoutDetailNotifier extends AutoDisposeNotifier<WorkoutDetailState> {
  @override
  WorkoutDetailState build() {
    return WorkoutDetailState(isLoading: true);
  }

  Future<void> getWorkoutDetailById(String workoutId) async {
    try {
      final result = await ref
          .read(workoutDetailServiceProvider)
          .getWorkoutDetailById(workoutId);

      result.when((success) {
        state = state.copyWith(
          workoutDetailResponse: success,
          isLoading: false,
          event: WorkoutDetailEvent.success,
        );
      }, (failure) {
        state = state.copyWith(
          event: WorkoutDetailEvent.error,
          error: failure.message,
          isLoading: false,
        );
      });
    } catch (e) {
      state = state.copyWith(
        event: WorkoutDetailEvent.error,
        error: e.toString(),
        isLoading: false,
      );
    }
  }
}
