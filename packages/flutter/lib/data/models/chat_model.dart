import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/chat_entity.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
abstract class ChatModel with _$ChatModel {
  const ChatModel._();

  const factory ChatModel({
    required String id,
    required String title,
    String? lastMessage,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  ChatEntity toEntity() =>
      ChatEntity(id: id, title: title, lastMessage: lastMessage);
}
