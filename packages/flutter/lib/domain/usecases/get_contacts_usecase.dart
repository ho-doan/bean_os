import 'package:injectable/injectable.dart';

import '../entities/contact_entity.dart';
import '../repositories/contacts_repository.dart';

@lazySingleton
class GetContactsUseCase {
  GetContactsUseCase(this._repository);

  final ContactsRepository _repository;

  Future<List<ContactEntity>> call() => _repository.getContacts();
}
