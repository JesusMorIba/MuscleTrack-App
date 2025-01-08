import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:muscle_track/common/exception/failure.dart';
import 'package:muscle_track/features/login/application/login_service.dart';
import 'package:muscle_track/features/login/data/dto/request/login_request.dart';
import 'package:muscle_track/features/login/data/repository/login_repository.dart';
import 'package:muscle_track/features/login/data/repository/login_repository_impl.dart';

final loginServiceProvider = Provider.autoDispose<LoginService>((ref) {
  final loginRepository = ref.watch(loginRepositoryProvider);

  return LoginServiceImpl(loginRepository);
});

final class LoginServiceImpl implements LoginService {
  final LoginRepository _loginRepository;

  LoginServiceImpl(this._loginRepository);

  @override
  Future<Result<bool, Failure>> login(LoginRequest loginRequest) async {
    try {
      await _loginRepository.login(loginRequest);

      return const Success(true);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(Failure(
        message: e.toString(),
        exception: e as Exception,
        stackTrace: s,
      ));
    }
  }
}
