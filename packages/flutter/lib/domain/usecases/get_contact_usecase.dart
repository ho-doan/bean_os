import 'package:injectable/injectable.dart';

import '../entities/contact_entity.dart';
import '../repositories/contacts_repository.dart';

@lazySingleton
class GetContactUseCase {
  GetContactUseCase(this._repository);

  final ContactsRepository _repository;

  Future<ContactEntity> call(String contactId) =>
      _repository.getContact(contactId);
}
