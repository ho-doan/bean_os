part of 'profile_detail_bloc.dart';

enum ProfileDetailStatus { initial, loading, success, failure }

@freezed
abstract class ProfileDetailState with _$ProfileDetailState {
  const factory ProfileDetailState({
    @Default(ProfileDetailStatus.initial) ProfileDetailStatus status,
    ProfileEntity? profile,
    String? errorMessage,
  }) = _ProfileDetailState;
}
