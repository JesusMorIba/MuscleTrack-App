// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutResponseImpl _$$WorkoutResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutResponseImpl(
      workouts: (json['workouts'] as List<dynamic>)
          .map((e) => Workout.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkoutResponseImplToJson(
        _$WorkoutResponseImpl instance) =>
    <String, dynamic>{
      'workouts': instance.workouts,
    };

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      level: json['level'] as String,
      minutes: (json['minutes'] as num).toInt(),
      cover: json['cover'] as String,
    );

Map<String, dynamic> _$$WorkoutImplToJson(_$WorkoutImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'level': instance.level,
      'minutes': instance.minutes,
      'cover': instance.cover,
    };

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
      exerciseId: json['exerciseId'] as String,
      sets: (json['sets'] as num?)?.toInt(),
      repetitions: (json['repetitions'] as num?)?.toInt(),
      time: (json['time'] as num?)?.toInt(),
      timeUnit: json['timeUnit'] as String?,
    );

Map<String, dynamic> _$$ExerciseImplToJson(_$ExerciseImpl instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'sets': instance.sets,
      'repetitions': instance.repetitions,
      'time': instance.time,
      'timeUnit': instance.timeUnit,
    };
