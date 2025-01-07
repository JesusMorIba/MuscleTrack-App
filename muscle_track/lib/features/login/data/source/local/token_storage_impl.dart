import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/core/core.dart';
import 'package:muscle_track/features/login/data/source/local/token_storage.dart';

final tokenStorageProvider = Provider.autoDispose<TokenStorage>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);

  return TokenStorageImpl(secureStorage);
});

final class TokenStorageImpl implements TokenStorage {
  final SecureStorageService _secureStorageService;

  TokenStorageImpl(this._secureStorageService);

  @override
  Future<void> storeToken(String accessToken, String refreshToken) async {
    await _secureStorageService.write(accessTokenKey, accessToken);
    await _secureStorageService.write(refreshTokenKey, refreshToken);
  }
}
