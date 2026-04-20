import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> login(String email, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password are required');
    }
  }
}
