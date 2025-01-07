import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'flutter_secure_storage_provider.dart';
import 'secure_storage_service.dart';

final secureStorageProvider = Provider<SecureStorageService>((ref) {
  final secureStorageService = ref.watch(flutterSecureStorageProvider);

  return SecureStorageImpl(secureStorageService);
});

final class SecureStorageImpl implements SecureStorageService {
  final FlutterSecureStorage _secureStorageImpl;

  SecureStorageImpl(this._secureStorageImpl);

  @override
  Future<void> delete(String key) async {
    try {
      await _secureStorageImpl.delete(key: key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> read(String key) async {
    try {
      return await _secureStorageImpl.read(key: key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> write(String key, String value) async {
    try {
      await _secureStorageImpl.write(key: key, value: value);
    } catch (e) {
      rethrow;
    }
  }
}
