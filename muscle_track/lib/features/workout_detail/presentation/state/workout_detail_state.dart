import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muscle_track/features/workout_detail/data/dto/response/workout_detail_response.dart';

part 'workout_detail_state.freezed.dart';

enum WorkoutDetailEvent { none, success, error }

@freezed
class WorkoutDetailState with _$WorkoutDetailState {
  factory WorkoutDetailState({
    @Default(false) bool isLoading,
    @Default(WorkoutDetailEvent.none) WorkoutDetailEvent event,
    @Default('') String error,
    @Default(null) WorkoutDetailResponse? workoutDetailResponse,
  }) = _WorkoutDetailState;
}
