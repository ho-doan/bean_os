import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';
import '../bloc/chats/chats_bloc.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key, required this.onOpenChat});

  final void Function(String chatId) onOpenChat;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ChatsBloc>()..add(const ChatsEvent.started()),
      child: BlocBuilder<ChatsBloc, ChatsState>(
        builder: (context, state) {
          return Scaffold(
            body: switch (state.status) {
              ChatsStatus.initial => const Center(
                child: CircularProgressIndicator(),
              ),
              ChatsStatus.loading => const Center(
                child: CircularProgressIndicator(),
              ),
              ChatsStatus.failure => Center(
                child: Text(
                  state.errorMessage ?? 'Error',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
              ChatsStatus.success => ListView.builder(
                itemCount: state.chats.length,
                itemBuilder: (context, index) {
                  final chat = state.chats[index];
                  return ListTile(
                    title: Text(chat.title),
                    subtitle:
                        chat.lastMessage != null
                            ? Text(chat.lastMessage!)
                            : null,
                    onTap: () => onOpenChat(chat.id),
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
