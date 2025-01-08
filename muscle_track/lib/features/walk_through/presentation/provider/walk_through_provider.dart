import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/features/walk_through/presentation/state/slider.dart';

// Provider
final walkThroughProvider =
    StateNotifierProvider<WalkThroughNotifier, WalkThroughState>((ref) {
  final carouselSliderController = CarouselSliderController();

  return WalkThroughNotifier(
      carouselSliderController: carouselSliderController);
});

// Notifier
class WalkThroughNotifier extends StateNotifier<WalkThroughState> {
  final CarouselSliderController carouselSliderController;

  WalkThroughNotifier({
    required this.carouselSliderController,
  }) : super(WalkThroughState(sliders: sliders));

  void onContinuePressed() {
    if (state.current == state.sliders.length - 1) {
    } else {
      carouselSliderController.nextPage();
    }
  }

  void onSkipPressed() {}

  void updateCurrentPage(int index) {
    state = state.copyWith(current: index);
  }
}

// State
class WalkThroughState {
  final List<Map<String, String>> sliders;
  final int current;

  WalkThroughState({
    this.sliders = const [],
    this.current = 0,
  });

  WalkThroughState copyWith({
    List<Map<String, String>>? slider,
    int? current,
  }) {
    return WalkThroughState(
      current: current ?? this.current,
      sliders: slider ?? sliders,
    );
  }
}
