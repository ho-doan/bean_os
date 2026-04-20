import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../local/app_database.dart';
import '../models/chat_model.dart';
import '../models/contact_model.dart';
import '../models/pos_order_model.dart';
import '../models/profile_model.dart';

/// Đọc/ghi cache cục bộ (Drift) cho dữ liệu đồng bộ từ API.
abstract class AppLocalDataSource {
  Future<void> saveAccessToken(String token);

  Future<String?> readAccessToken();

  Future<void> clearAccessToken();

  Future<void> cacheProfile(ProfileModel model);

  Future<ProfileModel?> readProfile(String id);

  Future<void> replaceContacts(List<ContactModel> models);

  Future<void> cacheContact(ContactModel model);

  Future<List<ContactModel>?> readAllContacts();

  Future<ContactModel?> readContact(String id);

  Future<void> replaceChats(List<ChatModel> models);

  Future<void> cacheChat(ChatModel model);

  Future<List<ChatModel>?> readAllChats();

  Future<ChatModel?> readChat(String id);

  Future<void> replaceKitchenQueue(List<PosOrderModel> models);

  Future<List<PosOrderModel>?> readKitchenQueue();

  Future<void> replaceActiveOrders(List<PosOrderModel> models);

  Future<List<PosOrderModel>?> readActiveOrders();
}

@LazySingleton(as: AppLocalDataSource)
class AppLocalDataSourceImpl implements AppLocalDataSource {
  AppLocalDataSourceImpl(this._db);

  final AppDatabase _db;

  static const String _kKitchenQueueKey = 'pos.kitchen.queue';
  static const String _kActiveOrdersKey = 'pos.orders.active';
  static const String _kAccessTokenKey = 'auth.access.token';

  DateTime get _now => DateTime.now();

  @override
  Future<void> saveAccessToken(String token) =>
      _db.upsertKv(_kAccessTokenKey, token);

  @override
  Future<String?> readAccessToken() => _db.getKv(_kAccessTokenKey);

  @override
  Future<void> clearAccessToken() => _db.deleteKv(_kAccessTokenKey);

  @override
  Future<void> cacheProfile(ProfileModel model) async {
    await _db.into(_db.cachedProfiles).insertOnConflictUpdate(
      CachedProfilesCompanion.insert(
        id: model.id,
        name: model.name,
        bio: Value(model.bio),
        updatedAt: _now,
      ),
    );
  }

  @override
  Future<ProfileModel?> readProfile(String id) async {
    final row = await (_db.select(_db.cachedProfiles)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    if (row == null) return null;
    return ProfileModel(id: row.id, name: row.name, bio: row.bio);
  }

  @override
  Future<void> replaceContacts(List<ContactModel> models) async {
    await _db.transaction(() async {
      await _db.delete(_db.cachedContacts).go();
      await _db.batch((b) {
        for (final m in models) {
          b.insert(
            _db.cachedContacts,
            CachedContactsCompanion.insert(
              id: m.id,
              name: m.name,
              updatedAt: _now,
            ),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
    });
  }

  @override
  Future<void> cacheContact(ContactModel model) async {
    await _db.into(_db.cachedContacts).insertOnConflictUpdate(
      CachedContactsCompanion.insert(
        id: model.id,
        name: model.name,
        updatedAt: _now,
      ),
    );
  }

  @override
  Future<List<ContactModel>?> readAllContacts() async {
    final rows = await _db.select(_db.cachedContacts).get();
    if (rows.isEmpty) return null;
    return rows.map((r) => ContactModel(id: r.id, name: r.name)).toList();
  }

  @override
  Future<ContactModel?> readContact(String id) async {
    final row = await (_db.select(_db.cachedContacts)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    if (row == null) return null;
    return ContactModel(id: row.id, name: row.name);
  }

  @override
  Future<void> replaceChats(List<ChatModel> models) async {
    await _db.transaction(() async {
      await _db.delete(_db.cachedChats).go();
      await _db.batch((b) {
        for (final m in models) {
          b.insert(
            _db.cachedChats,
            CachedChatsCompanion.insert(
              id: m.id,
              title: m.title,
              lastMessage: Value(m.lastMessage),
              updatedAt: _now,
            ),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
    });
  }

  @override
  Future<void> cacheChat(ChatModel model) async {
    await _db.into(_db.cachedChats).insertOnConflictUpdate(
      CachedChatsCompanion.insert(
        id: model.id,
        title: model.title,
        lastMessage: Value(model.lastMessage),
        updatedAt: _now,
      ),
    );
  }

  @override
  Future<List<ChatModel>?> readAllChats() async {
    final rows = await _db.select(_db.cachedChats).get();
    if (rows.isEmpty) return null;
    return rows
        .map(
          (r) => ChatModel(
            id: r.id,
            title: r.title,
            lastMessage: r.lastMessage,
          ),
        )
        .toList();
  }

  @override
  Future<ChatModel?> readChat(String id) async {
    final row = await (_db.select(_db.cachedChats)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    if (row == null) return null;
    return ChatModel(id: row.id, title: row.title, lastMessage: row.lastMessage);
  }

  @override
  Future<void> replaceKitchenQueue(List<PosOrderModel> models) async {
    final payload = jsonEncode(models.map((e) => e.toJson()).toList());
    await _db.upsertKv(_kKitchenQueueKey, payload);
  }

  @override
  Future<List<PosOrderModel>?> readKitchenQueue() async {
    final payload = await _db.getKv(_kKitchenQueueKey);
    if (payload == null || payload.isEmpty) {
      return null;
    }
    final rows = jsonDecode(payload) as List<dynamic>;
    return rows
        .map((e) => PosOrderModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  @override
  Future<void> replaceActiveOrders(List<PosOrderModel> models) async {
    final payload = jsonEncode(models.map((e) => e.toJson()).toList());
    await _db.upsertKv(_kActiveOrdersKey, payload);
  }

  @override
  Future<List<PosOrderModel>?> readActiveOrders() async {
    final payload = await _db.getKv(_kActiveOrdersKey);
    if (payload == null || payload.isEmpty) {
      return null;
    }
    final rows = jsonDecode(payload) as List<dynamic>;
    return rows
        .map((e) => PosOrderModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }
}
