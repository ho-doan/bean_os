import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';
import '../bloc/contacts/contacts_bloc.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key, required this.onOpenContact});

  final void Function(String contactId) onOpenContact;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ContactsBloc>()..add(const ContactsEvent.started()),
      child: BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) {
          return Scaffold(
            body: switch (state.status) {
              ContactsStatus.initial => const Center(
                child: CircularProgressIndicator(),
              ),
              ContactsStatus.loading => const Center(
                child: CircularProgressIndicator(),
              ),
              ContactsStatus.failure => Center(
                child: Text(
                  state.errorMessage ?? 'Error',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
              ContactsStatus.success => ListView.builder(
                itemCount: state.contacts.length,
                itemBuilder: (context, index) {
                  final c = state.contacts[index];
                  return ListTile(
                    title: Text(c.name),
                    onTap: () => onOpenContact(c.id),
                  );
                },
              ),
            },
          );
        },
      ),
    );
  }
}
