part of 'chat_detail_bloc.dart';

enum ChatDetailStatus { initial, loading, success, failure }

@freezed
abstract class ChatDetailState with _$ChatDetailState {
  const factory ChatDetailState({
    @Default(ChatDetailStatus.initial) ChatDetailStatus status,
    ChatEntity? chat,
    String? errorMessage,
  }) = _ChatDetailState;
}
