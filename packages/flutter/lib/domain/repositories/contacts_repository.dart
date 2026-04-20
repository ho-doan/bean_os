import '../entities/contact_entity.dart';

abstract class ContactsRepository {
  Future<List<ContactEntity>> getContacts();

  Future<ContactEntity> getContact(String contactId);
}
