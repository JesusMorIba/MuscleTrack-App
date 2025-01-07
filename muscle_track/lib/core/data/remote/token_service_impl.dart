import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/core/data/local/local.dart';
import 'package:muscle_track/core/data/remote/token_service.dart';
import 'package:muscle_track/common/common.dart';

final tokenServiceProvider = Provider.family<TokenService, Dio>((ref, dio) {
  final secureStorageImpl = ref.watch(secureStorageProvider);

  return TokenServiceImpl(dio, secureStorageImpl);
});

class TokenServiceImpl implements TokenService {
  final Dio _dio;
  final SecureStorageService _secureStorageService;

  TokenServiceImpl(this._dio, this._secureStorageService);

  @override
  Future<void> clearToken() {
    return Future.wait([
      _secureStorageService.delete(accessTokenKey),
      _secureStorageService.delete(refreshTokenKey),
    ]);
  }

  @override
  Future<String?> getAccessToken() =>
      _secureStorageService.read(accessTokenKey);

  @override
  Future<String?> getRefreshToken() =>
      _secureStorageService.read(refreshTokenKey);

  @override
  Future<RefreshTokenResponse> refreshToken(String? refreshToken) async {
    final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/refresh-token',
        data: {"refreshToken": refreshToken});

    if (response.statusCode == success) {
      return RefreshTokenResponse.fromJson(response.data ?? {});
    } else {
      throw DioException(
          requestOptions: response.requestOptions, response: response);
    }
  }

  @override
  Future<void> saveToken(String accessToken, String refreshToken) {
    return Future.wait([
      _secureStorageService.write(accessTokenKey, accessToken),
      _secureStorageService.write(refreshTokenKey, refreshToken)
    ]);
  }
}
