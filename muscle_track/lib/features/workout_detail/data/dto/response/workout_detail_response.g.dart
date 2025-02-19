// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutDetailResponseImpl _$$WorkoutDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutDetailResponseImpl(
      workout: Workout.fromJson(json['workout'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WorkoutDetailResponseImplToJson(
        _$WorkoutDetailResponseImpl instance) =>
    <String, dynamic>{
      'workout': instance.workout,
    };

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      level: json['level'] as String,
      minutes: (json['minutes'] as num).toInt(),
      cover: json['cover'] as String,
      description: json['description'] as String,
      workouts: (json['workouts'] as num).toInt(),
      kcal: (json['kcal'] as num).toInt(),
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$WorkoutImplToJson(_$WorkoutImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'level': instance.level,
      'minutes': instance.minutes,
      'cover': instance.cover,
      'description': instance.description,
      'workouts': instance.workouts,
      'kcal': instance.kcal,
      'exercises': instance.exercises,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
      exercise:
          ExerciseDetail.fromJson(json['exercise'] as Map<String, dynamic>),
      sets: (json['sets'] as num?)?.toInt(),
      repetitions: (json['repetitions'] as num?)?.toInt(),
      time: (json['time'] as num?)?.toInt(),
      timeUnit: json['timeUnit'] as String?,
    );

Map<String, dynamic> _$$ExerciseImplToJson(_$ExerciseImpl instance) =>
    <String, dynamic>{
      'exercise': instance.exercise,
      'sets': instance.sets,
      'repetitions': instance.repetitions,
      'time': instance.time,
      'timeUnit': instance.timeUnit,
    };

_$ExerciseDetailImpl _$$ExerciseDetailImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseDetailImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$ExerciseDetailImplToJson(
        _$ExerciseDetailImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
    };
