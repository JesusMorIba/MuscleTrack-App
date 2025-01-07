abstract interface class TokenStorage {
  Future<void> storeToken(String accessToken, String refreshToken);
}
