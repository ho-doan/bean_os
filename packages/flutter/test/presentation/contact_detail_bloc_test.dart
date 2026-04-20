import 'package:example/presentation/bloc/contact_detail/contact_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures.dart';
import '../helpers/bloc_harness.dart';
import '../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGetContactUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetContactUseCase();
  });

  setUpAll(() {
    registerFallbackValue('');
  });

  test('started: loading then success', () async {
    when(() => mockUseCase(any())).thenAnswer((_) async => tContactEntity);

    final bloc = ContactDetailBloc(mockUseCase, 'c1');
    addTearDown(bloc.close);

    await expectBlocEmissions<ContactDetailState>(
      bloc.stream,
      [
        isA<ContactDetailState>()
            .having((s) => s.status, 's', ContactDetailStatus.loading),
        isA<ContactDetailState>()
            .having((s) => s.status, 's', ContactDetailStatus.success)
            .having((s) => s.contact, 'c', tContactEntity),
      ],
      () async => bloc.add(const ContactDetailEvent.started()),
    );

    verify(() => mockUseCase('c1')).called(1);
  });

  test('started: loading then failure', () async {
    when(() => mockUseCase(any())).thenThrow(Exception('e'));

    final bloc = ContactDetailBloc(mockUseCase, 'c1');
    addTearDown(bloc.close);

    await expectBlocEmissions<ContactDetailState>(
      bloc.stream,
      [
        isA<ContactDetailState>()
            .having((s) => s.status, 's', ContactDetailStatus.loading),
        isA<ContactDetailState>()
            .having((s) => s.status, 's', ContactDetailStatus.failure)
            .having((s) => s.errorMessage, 'e', contains('e')),
      ],
      () async => bloc.add(const ContactDetailEvent.started()),
    );
  });
}
