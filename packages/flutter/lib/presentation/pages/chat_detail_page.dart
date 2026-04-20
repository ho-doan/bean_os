import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/chats_provider.dart';

class ChatDetailPage extends ConsumerWidget {
  const ChatDetailPage({
    super.key,
    required this.chatId,
    required this.onOpenSettings,
  });

  final String chatId;
  final void Function(String chatId) onOpenSettings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(chatDetailProvider(chatId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat $chatId'),
        actions: [
          IconButton(
            onPressed: () => onOpenSettings(chatId),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: chatState.when(
          loading: () => const CircularProgressIndicator(),
          error:
              (error, _) => Text(
                error.toString(),
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
          data:
              (chat) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(chat.title, style: Theme.of(context).textTheme.titleLarge),
                  if (chat.lastMessage != null)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(chat.lastMessage!),
                    ),
                ],
              ),
        ),
      ),
    );
  }
}
