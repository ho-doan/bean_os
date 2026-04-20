import 'package:flutter/material.dart';

class ChatDetailSettingsPage extends StatelessWidget {
  const ChatDetailSettingsPage({super.key, required this.chatId});

  final String chatId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat settings $chatId')),
      body: Center(child: Text('Chat Detail Settings — presentation')),
    );
  }
}
