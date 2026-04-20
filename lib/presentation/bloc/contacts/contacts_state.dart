part of 'contacts_bloc.dart';

enum ContactsStatus { initial, loading, success, failure }

@freezed
abstract class ContactsState with _$ContactsState {
  const factory ContactsState({
    @Default(ContactsStatus.initial) ContactsStatus status,
    @Default(<ContactEntity>[]) List<ContactEntity> contacts,
    String? errorMessage,
  }) = _ContactsState;
}
