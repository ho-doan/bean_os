import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/contact_entity.dart';
import 'usecase_providers.dart';

final contactsProvider =
    FutureProvider.autoDispose<List<ContactEntity>>((ref) async {
      return ref.read(getContactsUseCaseProvider)();
    });

final contactDetailProvider = FutureProvider.autoDispose.family<ContactEntity, String>((
  ref,
  contactId,
) async {
  return ref.read(getContactUseCaseProvider)(contactId);
});
