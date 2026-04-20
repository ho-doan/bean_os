import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import 'app_database_executor_io.dart'
    if (dart.library.html) 'app_database_executor_web.dart'
    as executor_io;

part 'app_database.g.dart';

/// Bảng key–value tùy chọn (settings, flags, …).
class AppKvEntries extends Table {
  TextColumn get key => text()();

  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('CachedProfileRow')
class CachedProfiles extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get bio => text().nullable()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('CachedContactRow')
class CachedContacts extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('CachedChatRow')
class CachedChats extends Table {
  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get lastMessage => text().nullable()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@lazySingleton
@DriftDatabase(
  tables: [AppKvEntries, CachedProfiles, CachedContacts, CachedChats],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_executor);

  static QueryExecutor get _executor =>
      executor_io.createAppDatabaseExecutor();

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(cachedProfiles);
            await m.createTable(cachedContacts);
            await m.createTable(cachedChats);
          }
        },
      );

  Future<void> upsertKv(String key, String value) async {
    await into(appKvEntries).insertOnConflictUpdate(
      AppKvEntriesCompanion.insert(key: key, value: value),
    );
  }

  Future<String?> getKv(String key) async {
    final row = await (select(appKvEntries)
          ..where((t) => t.key.equals(key)))
        .getSingleOrNull();
    return row?.value;
  }

  Future<void> deleteKv(String key) async {
    await (delete(appKvEntries)..where((t) => t.key.equals(key))).go();
  }
}
