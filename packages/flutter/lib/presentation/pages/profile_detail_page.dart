import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/profile_provider.dart';

class ProfileDetailPage extends ConsumerWidget {
  const ProfileDetailPage({
    super.key,
    required this.profileId,
    required this.onOpenEdit,
  });

  final String profileId;
  final void Function(String profileId) onOpenEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider(profileId));

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
          profileState.when(
            loading:
                () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(),
                  ),
                ),
            error:
                (error, _) => Text(
                  error.toString(),
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
            data:
                (profile) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (profile.bio != null) Text(profile.bio!),
                  ],
                ),
          ),
          TextButton(
            onPressed: () => onOpenEdit(profileId),
            child: const Text('Profile Edit'),
          ),
        ],
      ),
    );
  }
}
