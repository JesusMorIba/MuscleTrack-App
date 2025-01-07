import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/features/complete_profile/presentation/state/complete_profile_state.dart';

//! 1 - StateNotifierProvider
final completeProfileProvider =
    AutoDisposeNotifierProvider<CompleteProfileNotifier, CompleteProfileState>(
        (CompleteProfileNotifier.new));

//! 2 - Notifier
class CompleteProfileNotifier
    extends AutoDisposeNotifier<CompleteProfileState> {
  final PageController pageController = PageController();

  @override
  CompleteProfileState build() {
    return CompleteProfileState();
  }

  updatePage(int page) {
    state = state.copyWith(currentPageIndex: page);
  }

  updateGender(Gender gender) {
    state = state.copyWith(gender: gender);
  }

  updateAge(int age) {
    state = state.copyWith(age: age);
  }

  updateHeight(int height) {
    state = state.copyWith(height: height);
  }

  updateWeight(int weight) {
    state = state.copyWith(weight: weight);
  }

  updateActivityLevel(ActivityLevel activityLevel) {
    state = state.copyWith(activityLevel: activityLevel);
  }

  clearEvent() {
    state = state.copyWith(event: CompleteProfileEvent.none);
  }

  onContinuePressed() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    updatePage(state.currentPageIndex + 1);
  }

  onBackPressed() {
    if (pageController.page! > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      updatePage(state.currentPageIndex - 1);
    }
  }
}
