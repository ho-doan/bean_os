import 'package:example/data/datasources/app_local_data_source.dart';
import 'package:example/data/local/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase db;
  late AppLocalDataSource ds;

  setUp(() {
    db = AppDatabase();
    ds = AppLocalDataSourceImpl(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('AppLocalDataSourceImpl', () {
    test('cacheProfile / readProfile', () async {
      await ds.cacheProfile(tProfileModel);
      final read = await ds.readProfile('1');
      expect(read, tProfileModel);
    });

    test('replaceContacts / readAllContacts', () async {
      await ds.replaceContacts(tContactModels);
      final read = await ds.readAllContacts();
      expect(read, tContactModels);
    });

    test('readAllContacts returns null when empty', () async {
      expect(await ds.readAllContacts(), isNull);
    });

    test('cacheContact / readContact', () async {
      await ds.cacheContact(tContactModel);
      expect(await ds.readContact('c1'), tContactModel);
    });

    test('replaceChats / readAllChats', () async {
      await ds.replaceChats(tChatModels);
      final read = await ds.readAllChats();
      expect(read, tChatModels);
    });

    test('cacheChat / readChat', () async {
      await ds.cacheChat(tChatModel);
      expect(await ds.readChat('0'), tChatModel);
    });
  });
}
