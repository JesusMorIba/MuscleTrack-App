import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/common/common.dart';
import 'package:muscle_track/features/login/data/dto/dto.dart';
import 'package:muscle_track/features/login/data/source/local/token_storage.dart';
import 'package:muscle_track/features/login/data/source/local/token_storage_impl.dart';
import 'package:muscle_track/features/login/data/source/remote/login_api.dart';

import 'login_repository.dart';

final loginRepositoryProvider = Provider.autoDispose<LoginRepository>((ref) {
  final loginApi = ref.watch(loginApiProvider);
  final tokenStorageImpl = ref.watch(tokenStorageProvider);

  return LoginRepositoryImpl(loginApi, tokenStorageImpl);
});

final class LoginRepositoryImpl
    with DioExceptionMapper
    implements LoginRepository {
  final LoginApi _loginApi;
  final TokenStorage _tokenStorage;

  LoginRepositoryImpl(this._loginApi, this._tokenStorage);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      // api call
      final response = await _loginApi.login(loginRequest);
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
