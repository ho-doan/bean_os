import 'package:example/data/repositories/auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repo = AuthRepositoryImpl();

  test('login succeeds with non-empty credentials', () async {
    await expectLater(
      repo.login('user@example.com', 'password'),
      completes,
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
