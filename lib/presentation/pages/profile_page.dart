import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';
import '../bloc/profile/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.onOpenProfileDetail});

  final void Function(String profileId) onOpenProfileDetail;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              sl<ProfileBloc>()..add(const ProfileEvent.started(profileId: '1')),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  'Profile',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                switch (state.status) {
                  ProfileStatus.initial => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  ProfileStatus.loading => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  ProfileStatus.failure => Text(
                    state.errorMessage ?? 'Error',
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                  ProfileStatus.success => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.profile != null) ...[
                        Text(state.profile!.name),
                        if (state.profile!.bio != null)
                          Text(state.profile!.bio!),
                      ],
                    ],
                  ),
                },
                TextButton(
                  onPressed: () => onOpenProfileDetail('1'),
                  child: const Text('Profile Detail'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
