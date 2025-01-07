import 'package:muscle_track/common/dtos/dtos.dart';

abstract interface class TokenService {
  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> saveToken(String accessToken, String refreshToken);

  Future<void> clearToken();

  Future<RefreshTokenResponse> refreshToken(String? refreshToken);
}
