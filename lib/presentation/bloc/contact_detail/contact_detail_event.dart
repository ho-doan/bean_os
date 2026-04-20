part of 'contact_detail_bloc.dart';

@freezed
sealed class ContactDetailEvent with _$ContactDetailEvent {
  const factory ContactDetailEvent.started() = _Started;
}
