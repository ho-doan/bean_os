part of 'chats_bloc.dart';

enum ChatsStatus { initial, loading, success, failure }

@freezed
abstract class ChatsState with _$ChatsState {
  const factory ChatsState({
    @Default(ChatsStatus.initial) ChatsStatus status,
    @Default(<ChatEntity>[]) List<ChatEntity> chats,
    String? errorMessage,
  }) = _ChatsState;
}
