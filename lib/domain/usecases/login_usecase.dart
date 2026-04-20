import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';

@lazySingleton
class LoginUseCase {
  LoginUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> call(String email, String password) =>
      _repository.login(email, password);
}
