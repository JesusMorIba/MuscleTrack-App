import 'package:freezed_annotation/freezed_annotation.dart';

part 'complete_profile_state.freezed.dart';

enum CompleteProfileEvent { none, success, error }

enum Gender { woman, man }

enum ActivityLevel {
  sedentary,
  lightlyActive,
  moderatelyActive,
  veryActive,
  athlete
}

@freezed
class CompleteProfileState with _$CompleteProfileState {
  factory CompleteProfileState({
    @Default(false) bool isFormPosted,
    @Default(false) bool isValid,
    @Default(false) bool isLoading,
    @Default(0) int currentPageIndex,
    Gender? gender,
    int? age,
    int? height,
    int? weight,
    String? error,
    ActivityLevel? activityLevel,
    @Default(CompleteProfileEvent.none) CompleteProfileEvent event,
  }) = _CompleteProfileState;
}
