import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/contacts_provider.dart';

class ContactDetailPage extends ConsumerWidget {
  const ContactDetailPage({
    super.key,
    required this.contactId,
    required this.onOpenEdit,
  });

  final String contactId;
  final void Function(String contactId) onOpenEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactState = ref.watch(contactDetailProvider(contactId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Contact $contactId'),
        actions: [
          IconButton(
            onPressed: () => onOpenEdit(contactId),
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          contactState.when(
            loading:
                () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(),
                  ),
                ),
            error:
                (error, _) => Text(
                  error.toString(),
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
            data:
                (contact) => Text(
                  contact.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
          ),
          TextButton(
            onPressed: () => onOpenEdit(contactId),
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }
}
