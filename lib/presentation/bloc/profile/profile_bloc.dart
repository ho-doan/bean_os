import 'package:bloc/bloc.dart';
import 'package:example/domain/entities/profile_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/get_profile_usecase.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._getProfile) : super(const ProfileState()) {
    on<ProfileEvent>((event, emit) async {
      await event.when(
        started: (profileId) async {
          emit(state.copyWith(status: ProfileStatus.loading));
          try {
            final profile = await _getProfile(profileId);
            emit(
              state.copyWith(
                status: ProfileStatus.success,
                profile: profile,
                errorMessage: null,
              ),
            );
          } catch (e) {
            emit(
              state.copyWith(
                status: ProfileStatus.failure,
                errorMessage: e.toString(),
              ),
            );
          }
        },
      );
    });
  }

  final GetProfileUseCase _getProfile;
}
