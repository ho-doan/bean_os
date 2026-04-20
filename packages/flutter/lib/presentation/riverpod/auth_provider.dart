import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/auth/auth_session.dart';
import '../../core/di/injection.dart';
import '../../data/datasources/app_local_data_source.dart';
import 'usecase_providers.dart';

/// Nguon su that auth cho router redirect.
final ValueNotifier<bool> authStateListenable = ValueNotifier<bool>(false);

/// Bridge provider de reuse trong presentation khi can.
final authStateListenableProvider = Provider<ValueNotifier<bool>>(
  (ref) => authStateListenable,
);

Future<void> hydrateAuthStateFromStorage() async {
  final token = await sl<AppLocalDataSource>().readAccessToken();
  AuthSession.setAccessToken(token);
  authStateListenable.value = AuthSession.isAuthenticated;
}

class LoginController extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> submit({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final token = await ref.read(loginUseCaseProvider)(email, password);
      AuthSession.setAccessToken(token);
      await sl<AppLocalDataSource>().saveAccessToken(token);
      authStateListenable.value = true;
    });
  }

  Future<void> logout() async {
    AuthSession.clear();
    await sl<AppLocalDataSource>().clearAccessToken();
    authStateListenable.value = false;
  }
}

final loginControllerProvider =
    AutoDisposeAsyncNotifierProvider<LoginController, void>(
      LoginController.new,
    );
