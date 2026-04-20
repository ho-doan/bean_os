import '../entities/chat_entity.dart';

abstract class ChatsRepository {
  Future<List<ChatEntity>> getChats();

  Future<ChatEntity> getChat(String chatId);
}
