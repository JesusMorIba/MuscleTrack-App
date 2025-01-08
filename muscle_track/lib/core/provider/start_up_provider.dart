import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/core/data/local/secure_storage_const.dart';
import 'package:muscle_track/core/data/local/secure_storage_impl.dart';
import 'package:muscle_track/core/provider/auth_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'start_up_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> startUp(Ref ref) async {
  final secureStorage = ref.watch(secureStorageProvider);

  await Future.delayed(const Duration(seconds: 3));

  final accessToken = await secureStorage.read(accessTokenKey);

  if (accessToken != null) {
    ref.read(authStateProvider.notifier).setAuthState(true);
  }
}
