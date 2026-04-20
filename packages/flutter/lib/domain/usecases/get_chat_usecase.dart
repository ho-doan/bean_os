import 'package:injectable/injectable.dart';

import '../entities/chat_entity.dart';
import '../repositories/chats_repository.dart';

@lazySingleton
class GetChatUseCase {
  GetChatUseCase(this._repository);

  final ChatsRepository _repository;

  Future<ChatEntity> call(String chatId) => _repository.getChat(chatId);
}
