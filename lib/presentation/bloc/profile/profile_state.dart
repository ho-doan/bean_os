part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, success, failure }

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(ProfileStatus.initial) ProfileStatus status,
    ProfileEntity? profile,
    String? errorMessage,
  }) = _ProfileState;
}
