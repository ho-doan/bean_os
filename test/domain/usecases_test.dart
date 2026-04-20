import 'package:example/domain/usecases/get_chat_usecase.dart';
import 'package:example/domain/usecases/get_chats_usecase.dart';
import 'package:example/domain/usecases/get_contact_usecase.dart';
import 'package:example/domain/usecases/get_contacts_usecase.dart';
import 'package:example/domain/usecases/get_profile_usecase.dart';
import 'package:example/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures.dart';
import '../mocks.dart';

void main() {
  group('GetProfileUseCase', () {
    test('delegates to repository', () async {
      final repo = MockProfileRepository();
      when(() => repo.getProfile('1')).thenAnswer((_) async => tProfileEntity);
      final useCase = GetProfileUseCase(repo);
      expect(await useCase('1'), tProfileEntity);
      verify(() => repo.getProfile('1')).called(1);
    });
  });

  group('GetContactsUseCase', () {
    test('delegates to repository', () async {
      final repo = MockContactsRepository();
      when(() => repo.getContacts()).thenAnswer((_) async => [tContactEntity]);
      final useCase = GetContactsUseCase(repo);
      expect(await useCase(), [tContactEntity]);
      verify(() => repo.getContacts()).called(1);
    });
  });

  group('GetContactUseCase', () {
    test('delegates to repository', () async {
      final repo = MockContactsRepository();
      when(() => repo.getContact('c1')).thenAnswer((_) async => tContactEntity);
      final useCase = GetContactUseCase(repo);
      expect(await useCase('c1'), tContactEntity);
      verify(() => repo.getContact('c1')).called(1);
    });
  });

  group('GetChatsUseCase', () {
    test('delegates to repository', () async {
      final repo = MockChatsRepository();
      when(() => repo.getChats()).thenAnswer((_) async => [tChatEntity]);
      final useCase = GetChatsUseCase(repo);
      expect(await useCase(), [tChatEntity]);
      verify(() => repo.getChats()).called(1);
    });
  });

  group('GetChatUseCase', () {
    test('delegates to repository', () async {
      final repo = MockChatsRepository();
      when(() => repo.getChat('0')).thenAnswer((_) async => tChatEntity);
      final useCase = GetChatUseCase(repo);
      expect(await useCase('0'), tChatEntity);
      verify(() => repo.getChat('0')).called(1);
    });
  });

  group('LoginUseCase', () {
    test('delegates to repository', () async {
      final repo = MockAuthRepository();
      when(() => repo.login('a@b.c', 'secret')).thenAnswer((_) async {});
      final useCase = LoginUseCase(repo);
      await useCase('a@b.c', 'secret');
      verify(() => repo.login('a@b.c', 'secret')).called(1);
    });
  });
}
