part of 'chat_detail_bloc.dart';

@freezed
sealed class ChatDetailEvent with _$ChatDetailEvent {
  const factory ChatDetailEvent.started() = _Started;
}
