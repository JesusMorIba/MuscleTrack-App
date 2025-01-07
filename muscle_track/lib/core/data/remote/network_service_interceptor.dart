import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/common/common.dart';
import 'package:muscle_track/core/data/remote/endpoint.dart';
import 'package:muscle_track/core/data/remote/token_service.dart';
import 'package:muscle_track/core/data/remote/token_service_impl.dart';

final networkServiceInterceptorProvider =
    Provider.family<NetworkServiceInterceptor, Dio>((ref, dio) {
  final tokenServiceImpl = ref.watch(tokenServiceProvider(dio));

  return NetworkServiceInterceptor(tokenServiceImpl, dio);
});

final class NetworkServiceInterceptor extends Interceptor {
  final TokenService _tokenService;
  final Dio _dio;

  NetworkServiceInterceptor(this._tokenService, this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _tokenService.getAccessToken();

    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    // if the access token is not null, add it to the request headers
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // handle unauthorized error
    if (err.response?.statusCode == unauthorized &&
        err.requestOptions.path != loginEndPoint) {
      final token = await _tokenService.getRefreshToken();

      try {
        // refresh token request - api call
        final result = await _tokenService.refreshToken(token);

        final accesToken = result.data.accessToken;
        final refreshToken = result.data.refreshToken;

        // save new access token and refresh token to secure storage
        await _tokenService.saveToken(accesToken, refreshToken);

        final options = err.requestOptions;
        // update request headers with new access token
        options.headers['Authorization'] = 'Bearer $accesToken';
        // repeat the request with new access token
        return handler.resolve(await _dio.fetch(options));
      } on DioException catch (e) {
        if (e.response?.statusCode == refreshTokenExpired) {
          // remove access token and refresh token from secure storage
          await _tokenService.clearToken();

          return handler.next(err);
        }

        // continue with the error
        return handler.next(err);
      }
    }
    // continue with the error
    return handler.next(err);
  }
}
