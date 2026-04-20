import 'package:example/presentation/bloc/auth/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/bloc_harness.dart';
import '../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockLoginUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockLoginUseCase();
  });

  setUpAll(() {
    registerFallbackValue('');
  });

  test('submitted: submitting then success', () async {
    when(() => mockUseCase(any(), any())).thenAnswer((_) async {});

    final bloc = LoginBloc(mockUseCase);
    addTearDown(bloc.close);

    await expectBlocEmissions<LoginState>(
      bloc.stream,
      [
        isA<LoginState>().having((s) => s.status, 's', LoginStatus.submitting),
        isA<LoginState>()
            .having((s) => s.status, 's', LoginStatus.success)
            .having((s) => s.errorMessage, 'e', isNull),
      ],
      () async => bloc.add(
        const LoginEvent.submitted(email: 'a@b.c', password: 'pw'),
      ),
    );

    verify(() => mockUseCase('a@b.c', 'pw')).called(1);
  });

  test('submitted: submitting then failure', () async {
    when(() => mockUseCase(any(), any())).thenThrow(Exception('bad'));

    final bloc = LoginBloc(mockUseCase);
    addTearDown(bloc.close);

    await expectBlocEmissions<LoginState>(
      bloc.stream,
      [
        isA<LoginState>().having((s) => s.status, 's', LoginStatus.submitting),
        isA<LoginState>()
            .having((s) => s.status, 's', LoginStatus.failure)
            .having((s) => s.errorMessage, 'e', contains('bad')),
      ],
      () async => bloc.add(
        const LoginEvent.submitted(email: 'a@b.c', password: 'pw'),
      ),
    );
  });
}
