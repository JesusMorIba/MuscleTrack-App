import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_detail_response.freezed.dart';
part 'workout_detail_response.g.dart';

@freezed
class WorkoutDetailResponse with _$WorkoutDetailResponse {
  const factory WorkoutDetailResponse({
    @JsonKey(name: "workout") required Workout workout,
  }) = _WorkoutDetailResponse;

  factory WorkoutDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkoutDetailResponseFromJson(json);
}

@freezed
class Workout with _$Workout {
  const factory Workout({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "level") required String level,
    @JsonKey(name: "minutes") required int minutes,
    @JsonKey(name: "cover") required String cover,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "workouts") required int workouts,
    @JsonKey(name: "kcal") required int kcal,
    @JsonKey(name: "exercises") required List<Exercise> exercises,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
  }) = _Workout;

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
}

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    @JsonKey(name: "exercise") required ExerciseDetail exercise,
    @JsonKey(name: "sets") int? sets,
    @JsonKey(name: "repetitions") int? repetitions,
    @JsonKey(name: "time") int? time,
    @JsonKey(name: "timeUnit") String? timeUnit,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
}

@freezed
class ExerciseDetail with _$ExerciseDetail {
  const factory ExerciseDetail({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "category") required String category,
    @JsonKey(name: "imageUrl") required String imageUrl,
  }) = _ExerciseDetail;

  factory ExerciseDetail.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDetailFromJson(json);
}
