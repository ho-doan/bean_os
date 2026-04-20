part of 'profile_detail_bloc.dart';

@freezed
sealed class ProfileDetailEvent with _$ProfileDetailEvent {
  const factory ProfileDetailEvent.started() = _Started;
}
