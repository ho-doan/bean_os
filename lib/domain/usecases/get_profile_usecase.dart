import 'package:injectable/injectable.dart';

import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class GetProfileUseCase {
  GetProfileUseCase(this._repository);

  final ProfileRepository _repository;

  Future<ProfileEntity> call(String profileId) =>
      _repository.getProfile(profileId);
}
