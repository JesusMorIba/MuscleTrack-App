import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:muscle_track/common/exception/failure.dart';
import 'package:muscle_track/features/signup/application/signup_service.dart';
import 'package:muscle_track/features/signup/data/dto/dto.dart';
import 'package:muscle_track/features/signup/data/repository/signup_repository.dart';
import 'package:muscle_track/features/signup/data/repository/signup_repository_impl.dart';

final signupServiceProvider = Provider.autoDispose<SignupService>((ref) {
  final signupRepository = ref.watch(signupRepositoryProvider);

  return SignupServiceImpl(signupRepository);
});

final class SignupServiceImpl implements SignupService {
  final SignupRepository _signupRepository;

  SignupServiceImpl(this._signupRepository);

  @override
  Future<Result<bool, Failure>> signup(SignupRequest signupRequest) async {
    try {
      await _signupRepository.signup(signupRequest);

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
