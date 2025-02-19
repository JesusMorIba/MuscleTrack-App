import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/features/home/application/home_service_impl.dart';
import 'package:muscle_track/features/home/presentation/state/home_state.dart';

//! 1 - StateNotifierProvider
final homeProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) => HomeNotifier(ref));

//! 2 - Notifier
class HomeNotifier extends StateNotifier<HomeState> {
  final Ref ref;

  HomeNotifier(this.ref) : super(HomeState()) {
    getSuggestedWorkouts();
  }

  Future<void> getSuggestedWorkouts() async {
    try {
      state = state.copyWith(event: HomeEvent.none, isLoading: true, error: '');

      final result = await ref.read(homeServiceProvider).getSuggestedWorkouts();

      result.when(
        (success) {
          state = state.copyWith(
            workouts: success.workouts,
            event: HomeEvent.success,
            isLoading: false,
          );
        },
        (failure) {
          state = state.copyWith(
            event: HomeEvent.error,
            error: failure.message,
            isLoading: false,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        event: HomeEvent.error,
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}
