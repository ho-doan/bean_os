import 'package:example/data/models/contact_model.dart';
import 'package:example/data/repositories/contacts_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';
import '../../mocks.dart';

void main() {
  late MockAppRemoteDataSource remote;
  late MockAppLocalDataSource local;
  late ContactsRepositoryImpl repo;

  setUp(() {
    remote = MockAppRemoteDataSource();
    local = MockAppLocalDataSource();
    repo = ContactsRepositoryImpl(remote, local);
  });

  setUpAll(() {
    registerFallbackValue(<ContactModel>[]);
  });

  group('getContacts', () {
    test('returns remote list and replaces local cache', () async {
      when(() => remote.fetchContacts()).thenAnswer((_) async => tContactModels);
      when(() => local.replaceContacts(any())).thenAnswer((_) async {});

      final list = await repo.getContacts();

      expect(list.length, tContactModels.length);
      verify(() => local.replaceContacts(tContactModels)).called(1);
    });

    test('returns remote when replaceContacts fails', () async {
      when(() => remote.fetchContacts()).thenAnswer((_) async => tContactModels);
      when(() => local.replaceContacts(any())).thenThrow(Exception('db'));

      final list = await repo.getContacts();

      expect(list.length, tContactModels.length);
    });

    test('returns cache when remote fails', () async {
      when(() => remote.fetchContacts()).thenThrow(Exception('net'));
      when(() => local.readAllContacts()).thenAnswer((_) async => tContactModels);

      final list = await repo.getContacts();

      expect(list.length, tContactModels.length);
    });

    test('rethrows when remote fails and cache empty', () async {
      when(() => remote.fetchContacts()).thenThrow(Exception('net'));
      when(() => local.readAllContacts()).thenAnswer((_) async => null);

      expect(() => repo.getContacts(), throwsException);
    });
  });

  group('getContact', () {
    test('returns remote and caches contact', () async {
      when(() => remote.fetchContact('c1')).thenAnswer((_) async => tContactModel);
      when(() => local.cacheContact(tContactModel)).thenAnswer((_) async {});

      final entity = await repo.getContact('c1');

      expect(entity, tContactEntity);
      verify(() => local.cacheContact(tContactModel)).called(1);
    });

    test('returns cache when remote fails', () async {
      when(() => remote.fetchContact('c1')).thenThrow(Exception('net'));
      when(() => local.readContact('c1')).thenAnswer((_) async => tContactModel);

      expect(await repo.getContact('c1'), tContactEntity);
    });
  });
}
