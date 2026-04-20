import 'package:example/presentation/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures.dart';
import '../helpers/bloc_harness.dart';
import '../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGetChatUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetChatUseCase();
  });

  setUpAll(() {
    registerFallbackValue('');
  });

  test('started: loading then success', () async {
    when(() => mockUseCase(any())).thenAnswer((_) async => tChatEntity);

    final bloc = ChatDetailBloc(mockUseCase, '0');
    addTearDown(bloc.close);

    await expectBlocEmissions<ChatDetailState>(
      bloc.stream,
      [
        isA<ChatDetailState>()
            .having((s) => s.status, 's', ChatDetailStatus.loading),
        isA<ChatDetailState>()
            .having((s) => s.status, 's', ChatDetailStatus.success)
            .having((s) => s.chat, 'c', tChatEntity),
      ],
      () async => bloc.add(const ChatDetailEvent.started()),
    );

    verify(() => mockUseCase('0')).called(1);
  });

  test('started: loading then failure', () async {
    when(() => mockUseCase(any())).thenThrow(Exception('x'));

    final bloc = ChatDetailBloc(mockUseCase, '0');
    addTearDown(bloc.close);

    await expectBlocEmissions<ChatDetailState>(
      bloc.stream,
      [
        isA<ChatDetailState>()
            .having((s) => s.status, 's', ChatDetailStatus.loading),
        isA<ChatDetailState>()
            .having((s) => s.status, 's', ChatDetailStatus.failure)
            .having((s) => s.errorMessage, 'e', contains('x')),
      ],
      () async => bloc.add(const ChatDetailEvent.started()),
    );
  });
}
