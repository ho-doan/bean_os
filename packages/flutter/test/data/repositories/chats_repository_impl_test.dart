import 'package:example/data/models/chat_model.dart';
import 'package:example/data/repositories/chats_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';
import '../../mocks.dart';

void main() {
  late MockAppRemoteDataSource remote;
  late MockAppLocalDataSource local;
  late ChatsRepositoryImpl repo;

  setUp(() {
    remote = MockAppRemoteDataSource();
    local = MockAppLocalDataSource();
    repo = ChatsRepositoryImpl(remote, local);
  });

  setUpAll(() {
    registerFallbackValue(<ChatModel>[]);
  });

  group('getChats', () {
    test('returns remote list and replaces local cache', () async {
      when(() => remote.fetchChats()).thenAnswer((_) async => tChatModels);
      when(() => local.replaceChats(any())).thenAnswer((_) async {});

      final list = await repo.getChats();

      expect(list.length, tChatModels.length);
      verify(() => local.replaceChats(tChatModels)).called(1);
    });

    test('returns remote when replaceChats fails', () async {
      when(() => remote.fetchChats()).thenAnswer((_) async => tChatModels);
      when(() => local.replaceChats(any())).thenThrow(Exception('db'));

      final list = await repo.getChats();

      expect(list.length, tChatModels.length);
    });

    test('returns cache when remote fails', () async {
      when(() => remote.fetchChats()).thenThrow(Exception('net'));
      when(() => local.readAllChats()).thenAnswer((_) async => tChatModels);

      final list = await repo.getChats();

      expect(list.length, tChatModels.length);
    });

    test('rethrows when remote fails and cache empty', () async {
      when(() => remote.fetchChats()).thenThrow(Exception('net'));
      when(() => local.readAllChats()).thenAnswer((_) async => null);

      expect(() => repo.getChats(), throwsException);
    });
  });

  group('getChat', () {
    test('returns remote and caches chat', () async {
      when(() => remote.fetchChat('0')).thenAnswer((_) async => tChatModel);
      when(() => local.cacheChat(tChatModel)).thenAnswer((_) async {});

      final entity = await repo.getChat('0');

      expect(entity, tChatEntity);
      verify(() => local.cacheChat(tChatModel)).called(1);
    });

    test('returns cache when remote fails', () async {
      when(() => remote.fetchChat('0')).thenThrow(Exception('net'));
      when(() => local.readChat('0')).thenAnswer((_) async => tChatModel);

      expect(await repo.getChat('0'), tChatEntity);
    });
  });
}
