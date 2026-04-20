import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';
import '../bloc/chat_detail/chat_detail_bloc.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({
    super.key,
    required this.chatId,
    required this.onOpenSettings,
  });

  final String chatId;
  final void Function(String chatId) onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              sl<ChatDetailBloc>(param1: chatId, param2: null)
                ..add(const ChatDetailEvent.started()),
      child: BlocBuilder<ChatDetailBloc, ChatDetailState>(
        builder: (context, state) {
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
              child: switch (state.status) {
                ChatDetailStatus.initial => const CircularProgressIndicator(),
                ChatDetailStatus.loading => const CircularProgressIndicator(),
                ChatDetailStatus.failure => Text(
                  state.errorMessage ?? 'Error',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                ChatDetailStatus.success => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.chat?.title ?? '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    if (state.chat?.lastMessage != null)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(state.chat!.lastMessage!),
                      ),
                  ],
                ),
              },
            ),
          );
        },
      ),
    );
  }
}
