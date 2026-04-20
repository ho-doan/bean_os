import 'package:example/presentation/bloc/chats/chats_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures.dart';
import '../helpers/bloc_harness.dart';
import '../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGetChatsUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetChatsUseCase();
  });

  test('started: emits loading then success', () async {
    when(() => mockUseCase()).thenAnswer((_) async => [tChatEntity]);

    final bloc = ChatsBloc(mockUseCase);
    addTearDown(bloc.close);

    await expectBlocEmissions<ChatsState>(
      bloc.stream,
      [
        isA<ChatsState>().having((s) => s.status, 's', ChatsStatus.loading),
        isA<ChatsState>()
            .having((s) => s.status, 's', ChatsStatus.success)
            .having((s) => s.chats, 'c', [tChatEntity]),
      ],
      () async => bloc.add(const ChatsEvent.started()),
    );
  });

  test('started: emits loading then failure', () async {
    when(() => mockUseCase()).thenThrow(Exception('boom'));

    final bloc = ChatsBloc(mockUseCase);
    addTearDown(bloc.close);

    await expectBlocEmissions<ChatsState>(
      bloc.stream,
      [
        isA<ChatsState>().having((s) => s.status, 's', ChatsStatus.loading),
        isA<ChatsState>()
            .having((s) => s.status, 's', ChatsStatus.failure)
            .having((s) => s.errorMessage, 'e', contains('boom')),
      ],
      () async => bloc.add(const ChatsEvent.started()),
    );
  });
}
