part of 'contact_detail_bloc.dart';

enum ContactDetailStatus { initial, loading, success, failure }

@freezed
abstract class ContactDetailState with _$ContactDetailState {
  const factory ContactDetailState({
    @Default(ContactDetailStatus.initial) ContactDetailStatus status,
    ContactEntity? contact,
    String? errorMessage,
  }) = _ContactDetailState;
}
