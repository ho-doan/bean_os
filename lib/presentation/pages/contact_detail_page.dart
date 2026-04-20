import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';
import '../bloc/contact_detail/contact_detail_bloc.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({
    super.key,
    required this.contactId,
    required this.onOpenEdit,
  });

  final String contactId;
  final void Function(String contactId) onOpenEdit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              sl<ContactDetailBloc>(param1: contactId, param2: null)
                ..add(const ContactDetailEvent.started()),
      child: BlocBuilder<ContactDetailBloc, ContactDetailState>(
        builder: (context, state) {
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
                switch (state.status) {
                  ContactDetailStatus.initial => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  ContactDetailStatus.loading => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  ContactDetailStatus.failure => Text(
                    state.errorMessage ?? 'Error',
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                  ContactDetailStatus.success => Text(
                    state.contact?.name ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                },
                TextButton(
                  onPressed: () => onOpenEdit(contactId),
                  child: const Text('Edit'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
