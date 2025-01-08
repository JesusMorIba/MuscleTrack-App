import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/common/common.dart';
import 'package:muscle_track/features/login/data/source/local/token_storage.dart';
import 'package:muscle_track/features/login/data/source/local/token_storage_impl.dart';
import 'package:muscle_track/features/signup/data/dto/dto.dart';
import 'package:muscle_track/features/signup/data/repository/signup_repository.dart';
import 'package:muscle_track/features/signup/data/source/remote/signup_api.dart';

final signupRepositoryProvider = Provider.autoDispose<SignupRepository>((ref) {
  final signupApi = ref.watch(signupApiProvider);
  final tokenStorageImpl = ref.watch(tokenStorageProvider);

  return SignupRepositoryImpl(signupApi, tokenStorageImpl);
});

final class SignupRepositoryImpl
    with DioExceptionMapper
    implements SignupRepository {
  final SignupApi _signupApi;
  final TokenStorage _tokenStorage;

  SignupRepositoryImpl(this._signupApi, this._tokenStorage);

  @override
  Future<SignupResponse> signup(SignupRequest signupRequest) async {
    try {
      // api call
      final response = await _signupApi.signup(signupRequest);
      // get access token and refresh token from response
      final accessToken = response.data.accessToken;
      final refreshToken = response.data.refreshToken;
      // store in secure storage
      await _tokenStorage.storeToken(accessToken, refreshToken);

      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message:
            "An unexpected error occurred. Please try again later".hardcoded,
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}
