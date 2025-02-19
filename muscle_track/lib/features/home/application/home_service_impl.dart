import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:muscle_track/common/exception/failure.dart';
import 'package:muscle_track/features/home/application/home_service.dart';
import 'package:muscle_track/features/home/data/dto/response/workout_response.dart';
import 'package:muscle_track/features/home/data/repository/home_repository.dart';
import 'package:muscle_track/features/home/data/repository/home_repository_impl.dart';

final homeServiceProvider = Provider.autoDispose<HomeService>((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);

  return HomeServiceImpl(homeRepository);
});

final class HomeServiceImpl implements HomeService {
  final HomeRepository _homeRepository;

  HomeServiceImpl(this._homeRepository);

  @override
  Future<Result<WorkoutResponse, Failure>> getSuggestedWorkouts() async {
    try {
      // Llamada al repositorio para obtener los entrenamientos sugeridos
      final workouts = await _homeRepository.getSuggestedWorkouts();

      // Suponiendo que `workouts` es de tipo `WorkoutResponse`
      return Success(workouts);
    } on Failure catch (e) {
      // Manejo de fallos específicos
      return Error(e);
    } catch (e, s) {
      // Manejo de errores generales
      return Error(Failure(
        message: e.toString(),
        exception: e as Exception,
        stackTrace: s,
      ));
    }
  }
}
