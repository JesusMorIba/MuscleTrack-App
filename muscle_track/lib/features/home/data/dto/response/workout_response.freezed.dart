// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutResponse _$WorkoutResponseFromJson(Map<String, dynamic> json) {
  return _WorkoutResponse.fromJson(json);
}

/// @nodoc
mixin _$WorkoutResponse {
  @JsonKey(name: "workouts")
  List<Workout> get workouts => throw _privateConstructorUsedError;

  /// Serializes this WorkoutResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutResponseCopyWith<WorkoutResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutResponseCopyWith<$Res> {
  factory $WorkoutResponseCopyWith(
          WorkoutResponse value, $Res Function(WorkoutResponse) then) =
      _$WorkoutResponseCopyWithImpl<$Res, WorkoutResponse>;
  @useResult
  $Res call({@JsonKey(name: "workouts") List<Workout> workouts});
}

/// @nodoc
class _$WorkoutResponseCopyWithImpl<$Res, $Val extends WorkoutResponse>
    implements $WorkoutResponseCopyWith<$Res> {
  _$WorkoutResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workouts = null,
  }) {
    return _then(_value.copyWith(
      workouts: null == workouts
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutResponseImplCopyWith<$Res>
    implements $WorkoutResponseCopyWith<$Res> {
  factory _$$WorkoutResponseImplCopyWith(_$WorkoutResponseImpl value,
          $Res Function(_$WorkoutResponseImpl) then) =
      __$$WorkoutResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "workouts") List<Workout> workouts});
}

/// @nodoc
class __$$WorkoutResponseImplCopyWithImpl<$Res>
    extends _$WorkoutResponseCopyWithImpl<$Res, _$WorkoutResponseImpl>
    implements _$$WorkoutResponseImplCopyWith<$Res> {
  __$$WorkoutResponseImplCopyWithImpl(
      _$WorkoutResponseImpl _value, $Res Function(_$WorkoutResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workouts = null,
  }) {
    return _then(_$WorkoutResponseImpl(
      workouts: null == workouts
          ? _value._workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutResponseImpl implements _WorkoutResponse {
  const _$WorkoutResponseImpl(
      {@JsonKey(name: "workouts") required final List<Workout> workouts})
      : _workouts = workouts;

  factory _$WorkoutResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutResponseImplFromJson(json);

  final List<Workout> _workouts;
  @override
  @JsonKey(name: "workouts")
  List<Workout> get workouts {
    if (_workouts is EqualUnmodifiableListView) return _workouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  String toString() {
    return 'WorkoutResponse(workouts: $workouts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutResponseImpl &&
            const DeepCollectionEquality().equals(other._workouts, _workouts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_workouts));

  /// Create a copy of WorkoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutResponseImplCopyWith<_$WorkoutResponseImpl> get copyWith =>
      __$$WorkoutResponseImplCopyWithImpl<_$WorkoutResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutResponseImplToJson(
      this,
    );
  }
}

abstract class _WorkoutResponse implements WorkoutResponse {
  const factory _WorkoutResponse(
          {@JsonKey(name: "workouts") required final List<Workout> workouts}) =
      _$WorkoutResponseImpl;

  factory _WorkoutResponse.fromJson(Map<String, dynamic> json) =
      _$WorkoutResponseImpl.fromJson;

  @override
  @JsonKey(name: "workouts")
  List<Workout> get workouts;

  /// Create a copy of WorkoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutResponseImplCopyWith<_$WorkoutResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
      @JsonKey(name: "cover") String cover});
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
      @JsonKey(name: "cover") String cover});
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
      @JsonKey(name: "cover") required this.cover});

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
  String toString() {
    return 'Workout(id: $id, title: $title, level: $level, minutes: $minutes, cover: $cover)';
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
            (identical(other.cover, cover) || other.cover == cover));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, level, minutes, cover);

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
      @JsonKey(name: "cover") required final String cover}) = _$WorkoutImpl;

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
  @JsonKey(name: "exerciseId")
  String get exerciseId => throw _privateConstructorUsedError;
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
      {@JsonKey(name: "exerciseId") String exerciseId,
      @JsonKey(name: "sets") int? sets,
      @JsonKey(name: "repetitions") int? repetitions,
      @JsonKey(name: "time") int? time,
      @JsonKey(name: "timeUnit") String? timeUnit});
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
    Object? exerciseId = null,
    Object? sets = freezed,
    Object? repetitions = freezed,
    Object? time = freezed,
    Object? timeUnit = freezed,
  }) {
    return _then(_value.copyWith(
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(name: "exerciseId") String exerciseId,
      @JsonKey(name: "sets") int? sets,
      @JsonKey(name: "repetitions") int? repetitions,
      @JsonKey(name: "time") int? time,
      @JsonKey(name: "timeUnit") String? timeUnit});
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
    Object? exerciseId = null,
    Object? sets = freezed,
    Object? repetitions = freezed,
    Object? time = freezed,
    Object? timeUnit = freezed,
  }) {
    return _then(_$ExerciseImpl(
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(name: "exerciseId") required this.exerciseId,
      @JsonKey(name: "sets") this.sets,
      @JsonKey(name: "repetitions") this.repetitions,
      @JsonKey(name: "time") this.time,
      @JsonKey(name: "timeUnit") this.timeUnit});

  factory _$ExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseImplFromJson(json);

  @override
  @JsonKey(name: "exerciseId")
  final String exerciseId;
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
    return 'Exercise(exerciseId: $exerciseId, sets: $sets, repetitions: $repetitions, time: $time, timeUnit: $timeUnit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseImpl &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
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
      Object.hash(runtimeType, exerciseId, sets, repetitions, time, timeUnit);

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
      {@JsonKey(name: "exerciseId") required final String exerciseId,
      @JsonKey(name: "sets") final int? sets,
      @JsonKey(name: "repetitions") final int? repetitions,
      @JsonKey(name: "time") final int? time,
      @JsonKey(name: "timeUnit") final String? timeUnit}) = _$ExerciseImpl;

  factory _Exercise.fromJson(Map<String, dynamic> json) =
      _$ExerciseImpl.fromJson;

  @override
  @JsonKey(name: "exerciseId")
  String get exerciseId;
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
