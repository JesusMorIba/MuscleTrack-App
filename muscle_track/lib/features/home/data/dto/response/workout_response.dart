import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_response.freezed.dart';
part 'workout_response.g.dart';

@freezed
class WorkoutResponse with _$WorkoutResponse {
  const factory WorkoutResponse({
    @JsonKey(name: "workouts") required List<Workout> workouts,
  }) = _WorkoutResponse;

  factory WorkoutResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkoutResponseFromJson(json);
}

@freezed
class Workout with _$Workout {
  const factory Workout({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "level") required String level,
    @JsonKey(name: "minutes") required int minutes,
    @JsonKey(name: "cover") required String cover,
  }) = _Workout;

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
}

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    @JsonKey(name: "exerciseId") required String exerciseId,
    @JsonKey(name: "sets") int? sets,
    @JsonKey(name: "repetitions") int? repetitions,
    @JsonKey(name: "time") int? time,
    @JsonKey(name: "timeUnit") String? timeUnit,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
}
