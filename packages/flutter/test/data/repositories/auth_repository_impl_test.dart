import 'package:example/data/api/app_api.dart';
import 'package:example/data/models/auth_login_response_model.dart';
import 'package:example/data/repositories/auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppApi extends Mock implements AppApi {}

void main() {
  late _MockAppApi appApi;
  late AuthRepositoryImpl repo;

  setUp(() {
    appApi = _MockAppApi();
    repo = AuthRepositoryImpl(appApi);
  });

  test('login succeeds with non-empty credentials', () async {
    when(
      () => appApi.login(any()),
    ).thenAnswer(
      (_) async => const AuthLoginResponseModel(accessToken: 'token-123'),
    );
    await expectLater(
      repo.login('user@example.com', 'password'),
      completion('token-123'),
    );
  }, timeout: const Timeout(Duration(seconds: 2)));

  test('login throws when email empty', () async {
    await expectLater(
      repo.login('', 'password'),
      throwsA(isA<Exception>()),
    );
  }, timeout: const Timeout(Duration(seconds: 2)));

  test('login throws when password empty', () async {
    await expectLater(
      repo.login('user@example.com', ''),
      throwsA(isA<Exception>()),
    );
  }, timeout: const Timeout(Duration(seconds: 2)));
}
