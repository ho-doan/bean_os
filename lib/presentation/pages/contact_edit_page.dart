import 'package:flutter/material.dart';

class ContactEditPage extends StatelessWidget {
  const ContactEditPage({super.key, required this.contactId});

  final String contactId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts Edit $contactId')),
      body: Center(child: Text('Contacts Edit — presentation')),
    );
  }
}
