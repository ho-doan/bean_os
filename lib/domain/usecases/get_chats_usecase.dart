import 'package:injectable/injectable.dart';

import '../entities/chat_entity.dart';
import '../repositories/chats_repository.dart';

@lazySingleton
class GetChatsUseCase {
  GetChatsUseCase(this._repository);

  final ChatsRepository _repository;

  Future<List<ChatEntity>> call() => _repository.getChats();
}
