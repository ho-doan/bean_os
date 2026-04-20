import 'package:injectable/injectable.dart';

import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/app_local_data_source.dart';
import '../datasources/app_remote_data_source.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._remote, this._local);

  final AppRemoteDataSource _remote;
  final AppLocalDataSource _local;

  @override
  Future<ProfileEntity> getProfile(String profileId) async {
    try {
      final model = await _remote.fetchProfile(profileId);
      try {
        await _local.cacheProfile(model);
      } catch (_) {
        // Cache best-effort; không chặn response API.
      }
      return model.toEntity();
    } catch (_) {
      final cached = await _local.readProfile(profileId);
      if (cached != null) return cached.toEntity();
      rethrow;
    }
  }
}
