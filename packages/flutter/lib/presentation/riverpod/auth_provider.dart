import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'usecase_providers.dart';

class LoginController extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> submit({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(loginUseCaseProvider)(email, password);
    });
  }
}

final loginControllerProvider =
    AutoDisposeAsyncNotifierProvider<LoginController, void>(
      LoginController.new,
    );
