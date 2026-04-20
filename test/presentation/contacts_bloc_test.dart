import 'package:example/presentation/bloc/contacts/contacts_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures.dart';
import '../helpers/bloc_harness.dart';
import '../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGetContactsUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetContactsUseCase();
  });

  test('started: emits loading then success', () async {
    when(() => mockUseCase()).thenAnswer((_) async => [tContactEntity]);

    final bloc = ContactsBloc(mockUseCase);
    addTearDown(bloc.close);

    await expectBlocEmissions<ContactsState>(
      bloc.stream,
      [
        isA<ContactsState>().having((s) => s.status, 's', ContactsStatus.loading),
        isA<ContactsState>()
            .having((s) => s.status, 's', ContactsStatus.success)
            .having((s) => s.contacts, 'c', [tContactEntity]),
      ],
      () async => bloc.add(const ContactsEvent.started()),
    );
  });

  test('started: emits loading then failure', () async {
    when(() => mockUseCase()).thenThrow(Exception('err'));

    final bloc = ContactsBloc(mockUseCase);
    addTearDown(bloc.close);

    await expectBlocEmissions<ContactsState>(
      bloc.stream,
      [
        isA<ContactsState>().having((s) => s.status, 's', ContactsStatus.loading),
        isA<ContactsState>()
            .having((s) => s.status, 's', ContactsStatus.failure)
            .having((s) => s.errorMessage, 'e', contains('err')),
      ],
      () async => bloc.add(const ContactsEvent.started()),
    );
  });
}
