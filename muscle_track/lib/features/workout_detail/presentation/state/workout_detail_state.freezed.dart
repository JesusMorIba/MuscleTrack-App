// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkoutDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  WorkoutDetailEvent get event => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  WorkoutDetailResponse? get workoutDetailResponse =>
      throw _privateConstructorUsedError;

  /// Create a copy of WorkoutDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutDetailStateCopyWith<WorkoutDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutDetailStateCopyWith<$Res> {
  factory $WorkoutDetailStateCopyWith(
          WorkoutDetailState value, $Res Function(WorkoutDetailState) then) =
      _$WorkoutDetailStateCopyWithImpl<$Res, WorkoutDetailState>;
  @useResult
  $Res call(
      {bool isLoading,
      WorkoutDetailEvent event,
      String error,
      WorkoutDetailResponse? workoutDetailResponse});

  $WorkoutDetailResponseCopyWith<$Res>? get workoutDetailResponse;
}

/// @nodoc
class _$WorkoutDetailStateCopyWithImpl<$Res, $Val extends WorkoutDetailState>
    implements $WorkoutDetailStateCopyWith<$Res> {
  _$WorkoutDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? event = null,
    Object? error = null,
    Object? workoutDetailResponse = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as WorkoutDetailEvent,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      workoutDetailResponse: freezed == workoutDetailResponse
          ? _value.workoutDetailResponse
          : workoutDetailResponse // ignore: cast_nullable_to_non_nullable
              as WorkoutDetailResponse?,
    ) as $Val);
  }

  /// Create a copy of WorkoutDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkoutDetailResponseCopyWith<$Res>? get workoutDetailResponse {
    if (_value.workoutDetailResponse == null) {
      return null;
    }

    return $WorkoutDetailResponseCopyWith<$Res>(_value.workoutDetailResponse!,
        (value) {
      return _then(_value.copyWith(workoutDetailResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkoutDetailStateImplCopyWith<$Res>
    implements $WorkoutDetailStateCopyWith<$Res> {
  factory _$$WorkoutDetailStateImplCopyWith(_$WorkoutDetailStateImpl value,
          $Res Function(_$WorkoutDetailStateImpl) then) =
      __$$WorkoutDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      WorkoutDetailEvent event,
      String error,
      WorkoutDetailResponse? workoutDetailResponse});

  @override
  $WorkoutDetailResponseCopyWith<$Res>? get workoutDetailResponse;
}

/// @nodoc
class __$$WorkoutDetailStateImplCopyWithImpl<$Res>
    extends _$WorkoutDetailStateCopyWithImpl<$Res, _$WorkoutDetailStateImpl>
    implements _$$WorkoutDetailStateImplCopyWith<$Res> {
  __$$WorkoutDetailStateImplCopyWithImpl(_$WorkoutDetailStateImpl _value,
      $Res Function(_$WorkoutDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? event = null,
    Object? error = null,
    Object? workoutDetailResponse = freezed,
  }) {
    return _then(_$WorkoutDetailStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as WorkoutDetailEvent,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      workoutDetailResponse: freezed == workoutDetailResponse
          ? _value.workoutDetailResponse
          : workoutDetailResponse // ignore: cast_nullable_to_non_nullable
              as WorkoutDetailResponse?,
    ));
  }
}

/// @nodoc

class _$WorkoutDetailStateImpl implements _WorkoutDetailState {
  _$WorkoutDetailStateImpl(
      {this.isLoading = false,
      this.event = WorkoutDetailEvent.none,
      this.error = '',
      this.workoutDetailResponse = null});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final WorkoutDetailEvent event;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final WorkoutDetailResponse? workoutDetailResponse;

  @override
  String toString() {
    return 'WorkoutDetailState(isLoading: $isLoading, event: $event, error: $error, workoutDetailResponse: $workoutDetailResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.workoutDetailResponse, workoutDetailResponse) ||
                other.workoutDetailResponse == workoutDetailResponse));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, event, error, workoutDetailResponse);

  /// Create a copy of WorkoutDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutDetailStateImplCopyWith<_$WorkoutDetailStateImpl> get copyWith =>
      __$$WorkoutDetailStateImplCopyWithImpl<_$WorkoutDetailStateImpl>(
          this, _$identity);
}

abstract class _WorkoutDetailState implements WorkoutDetailState {
  factory _WorkoutDetailState(
          {final bool isLoading,
          final WorkoutDetailEvent event,
          final String error,
          final WorkoutDetailResponse? workoutDetailResponse}) =
      _$WorkoutDetailStateImpl;

  @override
  bool get isLoading;
  @override
  WorkoutDetailEvent get event;
  @override
  String get error;
  @override
  WorkoutDetailResponse? get workoutDetailResponse;

  /// Create a copy of WorkoutDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutDetailStateImplCopyWith<_$WorkoutDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
