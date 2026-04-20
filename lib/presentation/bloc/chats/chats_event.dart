part of 'chats_bloc.dart';

@freezed
sealed class ChatsEvent with _$ChatsEvent {
  const factory ChatsEvent.started() = _Started;
}
