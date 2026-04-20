import 'package:injectable/injectable.dart';

import '../../domain/entities/chat_entity.dart';
import '../../domain/repositories/chats_repository.dart';
import '../datasources/app_local_data_source.dart';
import '../datasources/app_remote_data_source.dart';

@LazySingleton(as: ChatsRepository)
class ChatsRepositoryImpl implements ChatsRepository {
  ChatsRepositoryImpl(this._remote, this._local);

  final AppRemoteDataSource _remote;
  final AppLocalDataSource _local;

  @override
  Future<List<ChatEntity>> getChats() async {
    try {
      final models = await _remote.fetchChats();
      try {
        await _local.replaceChats(models);
      } catch (_) {
        // Cache best-effort.
      }
      return models.map((m) => m.toEntity()).toList();
    } catch (_) {
      final cached = await _local.readAllChats();
      if (cached != null) {
        return cached.map((m) => m.toEntity()).toList();
      }
      rethrow;
    }
  }

  @override
  Future<ChatEntity> getChat(String chatId) async {
    try {
      final model = await _remote.fetchChat(chatId);
      try {
        await _local.cacheChat(model);
      } catch (_) {
        // Cache best-effort.
      }
      return model.toEntity();
    } catch (_) {
      final cached = await _local.readChat(chatId);
      if (cached != null) return cached.toEntity();
      rethrow;
    }
  }
}
