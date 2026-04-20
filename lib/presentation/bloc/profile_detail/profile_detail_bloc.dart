import 'package:bloc/bloc.dart';
import 'package:example/domain/entities/profile_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/get_profile_usecase.dart';

part 'profile_detail_bloc.freezed.dart';
part 'profile_detail_event.dart';
part 'profile_detail_state.dart';

@injectable
class ProfileDetailBloc extends Bloc<ProfileDetailEvent, ProfileDetailState> {
  ProfileDetailBloc(this._getProfile, @factoryParam this.profileId)
    : super(const ProfileDetailState()) {
    on<ProfileDetailEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(state.copyWith(status: ProfileDetailStatus.loading));
          try {
            final profile = await _getProfile(profileId);
            emit(
              state.copyWith(
                status: ProfileDetailStatus.success,
                profile: profile,
                errorMessage: null,
              ),
            );
          } catch (e) {
            emit(
              state.copyWith(
                status: ProfileDetailStatus.failure,
                errorMessage: e.toString(),
              ),
            );
          }
        },
      );
    });
  }

  final GetProfileUseCase _getProfile;
  final String profileId;
}
