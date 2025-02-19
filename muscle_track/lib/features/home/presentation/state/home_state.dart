import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muscle_track/features/home/data/dto/response/workout_response.dart';

part 'home_state.freezed.dart';

enum HomeEvent { none, success, error }

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(false) bool isLoading,
    @Default(HomeEvent.none) HomeEvent event,
    String? error,
    @Default([]) List<Workout> workouts,
  }) = _HomeState;
}
