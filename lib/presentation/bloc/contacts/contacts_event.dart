part of 'contacts_bloc.dart';

@freezed
sealed class ContactsEvent with _$ContactsEvent {
  const factory ContactsEvent.started() = _Started;
}
