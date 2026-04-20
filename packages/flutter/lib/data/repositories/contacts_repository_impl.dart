import 'package:injectable/injectable.dart';

import '../../domain/entities/contact_entity.dart';
import '../../domain/repositories/contacts_repository.dart';
import '../datasources/app_local_data_source.dart';
import '../datasources/app_remote_data_source.dart';

@LazySingleton(as: ContactsRepository)
class ContactsRepositoryImpl implements ContactsRepository {
  ContactsRepositoryImpl(this._remote, this._local);

  final AppRemoteDataSource _remote;
  final AppLocalDataSource _local;

  @override
  Future<List<ContactEntity>> getContacts() async {
    try {
      final models = await _remote.fetchContacts();
      try {
        await _local.replaceContacts(models);
      } catch (_) {
        // Cache best-effort.
      }
      return models.map((m) => m.toEntity()).toList();
    } catch (_) {
      final cached = await _local.readAllContacts();
      if (cached != null) {
        return cached.map((m) => m.toEntity()).toList();
      }
      rethrow;
    }
  }

  @override
  Future<ContactEntity> getContact(String contactId) async {
    try {
      final model = await _remote.fetchContact(contactId);
      try {
        await _local.cacheContact(model);
      } catch (_) {
        // Cache best-effort.
      }
      return model.toEntity();
    } catch (_) {
      final cached = await _local.readContact(contactId);
      if (cached != null) return cached.toEntity();
      rethrow;
    }
  }
}
