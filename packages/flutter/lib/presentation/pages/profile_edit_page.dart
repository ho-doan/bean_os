import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key, required this.profileId});

  final String profileId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Edit $profileId')),
      body: Center(child: Text('Profile Edit — presentation layer')),
    );
  }
}
