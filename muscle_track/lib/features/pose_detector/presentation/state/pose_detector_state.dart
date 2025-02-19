import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muscle_track/features/pose_detector/data/source/local/exercise_type.dart';

part 'pose_detector_state.freezed.dart';

enum PoseDetectorEvent { none, success, error }

@freezed
class PoseDetectorState with _$PoseDetectorState {
  factory PoseDetectorState({
    @Default(false) bool isLoading,
    @Default(PoseDetectorEvent.none) PoseDetectorEvent event,
    @Default('') String error,
    @Default(0) int repCount,
    @Default(false) bool isExerciseStarted,
    @Default(false) bool isBottomPositionReached,
    @Default('') String feedbackMessage,
    @Default(0.0) double rirEstimate,
    @Default(ExerciseType.squat) ExerciseType currentExercise,
  }) = _PoseDetectorState;
}
