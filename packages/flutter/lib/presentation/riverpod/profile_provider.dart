import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/profile_entity.dart';
import 'usecase_providers.dart';

final profileProvider =
    FutureProvider.autoDispose.family<ProfileEntity, String>((ref, profileId) async {
      return ref.read(getProfileUseCaseProvider)(profileId);
    });
