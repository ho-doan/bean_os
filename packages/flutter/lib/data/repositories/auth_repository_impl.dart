import 'package:injectable/injectable.dart';

import '../api/app_api.dart';
import '../models/auth_login_request_model.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._appApi);

  final AppApi _appApi;

  @override
  Future<String> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password are required');
    }

    final res = await _appApi.login(
      AuthLoginRequestModel(username: email, password: password).toJson(),
    );
    return res.accessToken;
  }
}
