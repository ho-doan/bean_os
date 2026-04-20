import 'package:equatable/equatable.dart';

class ChatEntity extends Equatable {
  const ChatEntity({
    required this.id,
    required this.title,
    this.lastMessage,
  });

  final String id;
  final String title;
  final String? lastMessage;

  @override
  List<Object?> get props => [id, title, lastMessage];
}
