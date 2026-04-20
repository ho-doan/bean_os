import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';
import '../bloc/profile_detail/profile_detail_bloc.dart';

class ProfileDetailPage extends StatelessWidget {
  const ProfileDetailPage({
    super.key,
    required this.profileId,
    required this.onOpenEdit,
  });

  final String profileId;
  final void Function(String profileId) onOpenEdit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              sl<ProfileDetailBloc>(param1: profileId, param2: null)
                ..add(const ProfileDetailEvent.started()),
      child: BlocBuilder<ProfileDetailBloc, ProfileDetailState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Profile Detail $profileId'),
              actions: [
                IconButton(
                  onPressed: () => onOpenEdit(profileId),
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                switch (state.status) {
                  ProfileDetailStatus.initial => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  ProfileDetailStatus.loading => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  ProfileDetailStatus.failure => Text(
                    state.errorMessage ?? 'Error',
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                  ProfileDetailStatus.success => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.profile?.name ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      if (state.profile?.bio != null)
                        Text(state.profile!.bio!),
                    ],
                  ),
                },
                TextButton(
                  onPressed: () => onOpenEdit(profileId),
                  child: const Text('Profile Edit'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
