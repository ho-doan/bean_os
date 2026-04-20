import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/chat_entity.dart';
import 'usecase_providers.dart';

final chatsProvider = FutureProvider.autoDispose<List<ChatEntity>>((ref) async {
  return ref.read(getChatsUseCaseProvider)();
});

final chatDetailProvider =
    FutureProvider.autoDispose.family<ChatEntity, String>((ref, chatId) async {
      return ref.read(getChatUseCaseProvider)(chatId);
    });
