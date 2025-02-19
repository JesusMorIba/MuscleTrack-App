// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutDetailResponse _$WorkoutDetailResponseFromJson(
    Map<String, dynamic> json) {
  return _WorkoutDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$WorkoutDetailResponse {
  @JsonKey(name: "workout")
  Workout get workout => throw _privateConstructorUsedError;

  /// Serializes this WorkoutDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutDetailResponseCopyWith<WorkoutDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutDetailResponseCopyWith<$Res> {
  factory $WorkoutDetailResponseCopyWith(WorkoutDetailResponse value,
          $Res Function(WorkoutDetailResponse) then) =
      _$WorkoutDetailResponseCopyWithImpl<$Res, WorkoutDetailResponse>;
  @useResult
  $Res call({@JsonKey(name: "workout") Workout workout});

  $WorkoutCopyWith<$Res> get workout;
}

/// @nodoc
class _$WorkoutDetailResponseCopyWithImpl<$Res,
        $Val extends WorkoutDetailResponse>
    implements $WorkoutDetailResponseCopyWith<$Res> {
  _$WorkoutDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
  }) {
    return _then(_value.copyWith(
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
    ) as $Val);
  }

  /// Create a copy of WorkoutDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkoutCopyWith<$Res> get workout {
    return $WorkoutCopyWith<$Res>(_value.workout, (value) {
      return _then(_value.copyWith(workout: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkoutDetailResponseImplCopyWith<$Res>
    implements $WorkoutDetailResponseCopyWith<$Res> {
  factory _$$WorkoutDetailResponseImplCopyWith(
          _$WorkoutDetailResponseImpl value,
          $Res Function(_$WorkoutDetailResponseImpl) then) =
      __$$WorkoutDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "workout") Workout workout});

  @override
  $WorkoutCopyWith<$Res> get workout;
}

/// @nodoc
class __$$WorkoutDetailResponseImplCopyWithImpl<$Res>
    extends _$WorkoutDetailResponseCopyWithImpl<$Res,
        _$WorkoutDetailResponseImpl>
    implements _$$WorkoutDetailResponseImplCopyWith<$Res> {
  __$$WorkoutDetailResponseImplCopyWithImpl(_$WorkoutDetailResponseImpl _value,
      $Res Function(_$WorkoutDetailResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
  }) {
    return _then(_$WorkoutDetailResponseImpl(
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutDetailResponseImpl implements _WorkoutDetailResponse {
  const _$WorkoutDetailResponseImpl(
      {@JsonKey(name: "workout") required this.workout});

  factory _$WorkoutDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutDetailResponseImplFromJson(json);

  @override
  @JsonKey(name: "workout")
  final Workout workout;

  @override
  String toString() {
    return 'WorkoutDetailResponse(workout: $workout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutDetailResponseImpl &&
            (identical(other.workout, workout) || other.workout == workout));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, workout);

  /// Create a copy of WorkoutDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutDetailResponseImplCopyWith<_$WorkoutDetailResponseImpl>
      get copyWith => __$$WorkoutDetailResponseImplCopyWithImpl<
          _$WorkoutDetailResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _WorkoutDetailResponse implements WorkoutDetailResponse {
  const factory _WorkoutDetailResponse(
          {@JsonKey(name: "workout") required final Workout workout}) =
      _$WorkoutDetailResponseImpl;

  factory _WorkoutDetailResponse.fromJson(Map<String, dynamic> json) =
      _$WorkoutDetailResponseImpl.fromJson;

  @override
  @JsonKey(name: "workout")
  Workout get workout;

  /// Create a copy of WorkoutDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutDetailResponseImplCopyWith<_$WorkoutDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return _Workout.fromJson(json);
}

/// @nodoc
mixin _$Workout {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "level")
  String get level => throw _privateConstructorUsedError;
  @JsonKey(name: "minutes")
  int get minutes => throw _privateConstructorUsedError;
  @JsonKey(name: "cover")
  String get cover => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "workouts")
  int get workouts => throw _privateConstructorUsedError;
  @JsonKey(name: "kcal")
  int get kcal => throw _privateConstructorUsedError;
  @JsonKey(name: "exercises")
  List<Exercise> get exercises => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Workout to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutCopyWith<Workout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) then) =
      _$WorkoutCopyWithImpl<$Res, Workout>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "level") String level,
      @JsonKey(name: "minutes") int minutes,
      @JsonKey(name: "cover") String cover,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "workouts") int workouts,
      @JsonKey(name: "kcal") int kcal,
      @JsonKey(name: "exercises") List<Exercise> exercises,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res, $Val extends Workout>
    implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? level = null,
    Object? minutes = null,
    Object? cover = null,
    Object? description = null,
    Object? workouts = null,
    Object? kcal = null,
    Object? exercises = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      workouts: null == workouts
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as int,
      kcal: null == kcal
          ? _value.kcal
          : kcal // ignore: cast_nullable_to_non_nullable
              as int,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutImplCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$$WorkoutImplCopyWith(
          _$WorkoutImpl value, $Res Function(_$WorkoutImpl) then) =
      __$$WorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "level") String level,
      @JsonKey(name: "minutes") int minutes,
      @JsonKey(name: "cover") String cover,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "workouts") int workouts,
      @JsonKey(name: "kcal") int kcal,
      @JsonKey(name: "exercises") List<Exercise> exercises,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});
}

/// @nodoc
class __$$WorkoutImplCopyWithImpl<$Res>
    extends _$WorkoutCopyWithImpl<$Res, _$WorkoutImpl>
    implements _$$WorkoutImplCopyWith<$Res> {
  __$$WorkoutImplCopyWithImpl(
      _$WorkoutImpl _value, $Res Function(_$WorkoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? level = null,
    Object? minutes = null,
    Object? cover = null,
    Object? description = null,
    Object? workouts = null,
    Object? kcal = null,
    Object? exercises = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$WorkoutImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      workouts: null == workouts
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as int,
      kcal: null == kcal
          ? _value.kcal
          : kcal // ignore: cast_nullable_to_non_nullable
              as int,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutImpl implements _Workout {
  const _$WorkoutImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "level") required this.level,
      @JsonKey(name: "minutes") required this.minutes,
      @JsonKey(name: "cover") required this.cover,
      @JsonKey(name: "description") required this.description,
      @JsonKey(name: "workouts") required this.workouts,
      @JsonKey(name: "kcal") required this.kcal,
      @JsonKey(name: "exercises") required final List<Exercise> exercises,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "updatedAt") required this.updatedAt})
      : _exercises = exercises;

  factory _$WorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "level")
  final String level;
  @override
  @JsonKey(name: "minutes")
  final int minutes;
  @override
  @JsonKey(name: "cover")
  final String cover;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "workouts")
  final int workouts;
  @override
  @JsonKey(name: "kcal")
  final int kcal;
  final List<Exercise> _exercises;
  @override
  @JsonKey(name: "exercises")
  List<Exercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Workout(id: $id, title: $title, level: $level, minutes: $minutes, cover: $cover, description: $description, workouts: $workouts, kcal: $kcal, exercises: $exercises, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.workouts, workouts) ||
                other.workouts == workouts) &&
            (identical(other.kcal, kcal) || other.kcal == kcal) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      level,
      minutes,
      cover,
      description,
      workouts,
      kcal,
      const DeepCollectionEquality().hash(_exercises),
      createdAt,
      updatedAt);

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      __$$WorkoutImplCopyWithImpl<_$WorkoutImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutImplToJson(
      this,
    );
  }
}

abstract class _Workout implements Workout {
  const factory _Workout(
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "title") required final String title,
          @JsonKey(name: "level") required final String level,
          @JsonKey(name: "minutes") required final int minutes,
          @JsonKey(name: "cover") required final String cover,
          @JsonKey(name: "description") required final String description,
          @JsonKey(name: "workouts") required final int workouts,
          @JsonKey(name: "kcal") required final int kcal,
          @JsonKey(name: "exercises") required final List<Exercise> exercises,
          @JsonKey(name: "createdAt") required final DateTime createdAt,
          @JsonKey(name: "updatedAt") required final DateTime updatedAt}) =
      _$WorkoutImpl;

  factory _Workout.fromJson(Map<String, dynamic> json) = _$WorkoutImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "level")
  String get level;
  @override
  @JsonKey(name: "minutes")
  int get minutes;
  @override
  @JsonKey(name: "cover")
  String get cover;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(name: "workouts")
  int get workouts;
  @override
  @JsonKey(name: "kcal")
  int get kcal;
  @override
  @JsonKey(name: "exercises")
  List<Exercise> get exercises;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return _Exercise.fromJson(json);
}

/// @nodoc
mixin _$Exercise {
  @JsonKey(name: "exercise")
  ExerciseDetail get exercise => throw _privateConstructorUsedError;
  @JsonKey(name: "sets")
  int? get sets => throw _privateConstructorUsedError;
  @JsonKey(name: "repetitions")
  int? get repetitions => throw _privateConstructorUsedError;
  @JsonKey(name: "time")
  int? get time => throw _privateConstructorUsedError;
  @JsonKey(name: "timeUnit")
  String? get timeUnit => throw _privateConstructorUsedError;

  /// Serializes this Exercise to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseCopyWith<Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) then) =
      _$ExerciseCopyWithImpl<$Res, Exercise>;
  @useResult
  $Res call(
      {@JsonKey(name: "exercise") ExerciseDetail exercise,
      @JsonKey(name: "sets") int? sets,
      @JsonKey(name: "repetitions") int? repetitions,
      @JsonKey(name: "time") int? time,
      @JsonKey(name: "timeUnit") String? timeUnit});

  $ExerciseDetailCopyWith<$Res> get exercise;
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res, $Val extends Exercise>
    implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
    Object? sets = freezed,
    Object? repetitions = freezed,
    Object? time = freezed,
    Object? timeUnit = freezed,
  }) {
    return _then(_value.copyWith(
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseDetail,
      sets: freezed == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int?,
      repetitions: freezed == repetitions
          ? _value.repetitions
          : repetitions // ignore: cast_nullable_to_non_nullable
              as int?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
      timeUnit: freezed == timeUnit
          ? _value.timeUnit
          : timeUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExerciseDetailCopyWith<$Res> get exercise {
    return $ExerciseDetailCopyWith<$Res>(_value.exercise, (value) {
      return _then(_value.copyWith(exercise: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExerciseImplCopyWith<$Res>
    implements $ExerciseCopyWith<$Res> {
  factory _$$ExerciseImplCopyWith(
          _$ExerciseImpl value, $Res Function(_$ExerciseImpl) then) =
      __$$ExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "exercise") ExerciseDetail exercise,
      @JsonKey(name: "sets") int? sets,
      @JsonKey(name: "repetitions") int? repetitions,
      @JsonKey(name: "time") int? time,
      @JsonKey(name: "timeUnit") String? timeUnit});

  @override
  $ExerciseDetailCopyWith<$Res> get exercise;
}

/// @nodoc
class __$$ExerciseImplCopyWithImpl<$Res>
    extends _$ExerciseCopyWithImpl<$Res, _$ExerciseImpl>
    implements _$$ExerciseImplCopyWith<$Res> {
  __$$ExerciseImplCopyWithImpl(
      _$ExerciseImpl _value, $Res Function(_$ExerciseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
    Object? sets = freezed,
    Object? repetitions = freezed,
    Object? time = freezed,
    Object? timeUnit = freezed,
  }) {
    return _then(_$ExerciseImpl(
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseDetail,
      sets: freezed == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int?,
      repetitions: freezed == repetitions
          ? _value.repetitions
          : repetitions // ignore: cast_nullable_to_non_nullable
              as int?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
      timeUnit: freezed == timeUnit
          ? _value.timeUnit
          : timeUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseImpl implements _Exercise {
  const _$ExerciseImpl(
      {@JsonKey(name: "exercise") required this.exercise,
      @JsonKey(name: "sets") this.sets,
      @JsonKey(name: "repetitions") this.repetitions,
      @JsonKey(name: "time") this.time,
      @JsonKey(name: "timeUnit") this.timeUnit});

  factory _$ExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseImplFromJson(json);

  @override
  @JsonKey(name: "exercise")
  final ExerciseDetail exercise;
  @override
  @JsonKey(name: "sets")
  final int? sets;
  @override
  @JsonKey(name: "repetitions")
  final int? repetitions;
  @override
  @JsonKey(name: "time")
  final int? time;
  @override
  @JsonKey(name: "timeUnit")
  final String? timeUnit;

  @override
  String toString() {
    return 'Exercise(exercise: $exercise, sets: $sets, repetitions: $repetitions, time: $time, timeUnit: $timeUnit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseImpl &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.repetitions, repetitions) ||
                other.repetitions == repetitions) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.timeUnit, timeUnit) ||
                other.timeUnit == timeUnit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, exercise, sets, repetitions, time, timeUnit);

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      __$$ExerciseImplCopyWithImpl<_$ExerciseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseImplToJson(
      this,
    );
  }
}

abstract class _Exercise implements Exercise {
  const factory _Exercise(
      {@JsonKey(name: "exercise") required final ExerciseDetail exercise,
      @JsonKey(name: "sets") final int? sets,
      @JsonKey(name: "repetitions") final int? repetitions,
      @JsonKey(name: "time") final int? time,
      @JsonKey(name: "timeUnit") final String? timeUnit}) = _$ExerciseImpl;

  factory _Exercise.fromJson(Map<String, dynamic> json) =
      _$ExerciseImpl.fromJson;

  @override
  @JsonKey(name: "exercise")
  ExerciseDetail get exercise;
  @override
  @JsonKey(name: "sets")
  int? get sets;
  @override
  @JsonKey(name: "repetitions")
  int? get repetitions;
  @override
  @JsonKey(name: "time")
  int? get time;
  @override
  @JsonKey(name: "timeUnit")
  String? get timeUnit;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExerciseDetail _$ExerciseDetailFromJson(Map<String, dynamic> json) {
  return _ExerciseDetail.fromJson(json);
}

/// @nodoc
mixin _$ExerciseDetail {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "category")
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: "imageUrl")
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this ExerciseDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseDetailCopyWith<ExerciseDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseDetailCopyWith<$Res> {
  factory $ExerciseDetailCopyWith(
          ExerciseDetail value, $Res Function(ExerciseDetail) then) =
      _$ExerciseDetailCopyWithImpl<$Res, ExerciseDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "category") String category,
      @JsonKey(name: "imageUrl") String imageUrl});
}

/// @nodoc
class _$ExerciseDetailCopyWithImpl<$Res, $Val extends ExerciseDetail>
    implements $ExerciseDetailCopyWith<$Res> {
  _$ExerciseDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseDetailImplCopyWith<$Res>
    implements $ExerciseDetailCopyWith<$Res> {
  factory _$$ExerciseDetailImplCopyWith(_$ExerciseDetailImpl value,
          $Res Function(_$ExerciseDetailImpl) then) =
      __$$ExerciseDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "category") String category,
      @JsonKey(name: "imageUrl") String imageUrl});
}

/// @nodoc
class __$$ExerciseDetailImplCopyWithImpl<$Res>
    extends _$ExerciseDetailCopyWithImpl<$Res, _$ExerciseDetailImpl>
    implements _$$ExerciseDetailImplCopyWith<$Res> {
  __$$ExerciseDetailImplCopyWithImpl(
      _$ExerciseDetailImpl _value, $Res Function(_$ExerciseDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExerciseDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? imageUrl = null,
  }) {
    return _then(_$ExerciseDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseDetailImpl implements _ExerciseDetail {
  const _$ExerciseDetailImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "category") required this.category,
      @JsonKey(name: "imageUrl") required this.imageUrl});

  factory _$ExerciseDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseDetailImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "category")
  final String category;
  @override
  @JsonKey(name: "imageUrl")
  final String imageUrl;

  @override
  String toString() {
    return 'ExerciseDetail(id: $id, title: $title, category: $category, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, category, imageUrl);

  /// Create a copy of ExerciseDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseDetailImplCopyWith<_$ExerciseDetailImpl> get copyWith =>
      __$$ExerciseDetailImplCopyWithImpl<_$ExerciseDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseDetailImplToJson(
      this,
    );
  }
}

abstract class _ExerciseDetail implements ExerciseDetail {
  const factory _ExerciseDetail(
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "title") required final String title,
          @JsonKey(name: "category") required final String category,
          @JsonKey(name: "imageUrl") required final String imageUrl}) =
      _$ExerciseDetailImpl;

  factory _ExerciseDetail.fromJson(Map<String, dynamic> json) =
      _$ExerciseDetailImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "category")
  String get category;
  @override
  @JsonKey(name: "imageUrl")
  String get imageUrl;

  /// Create a copy of ExerciseDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseDetailImplCopyWith<_$ExerciseDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
