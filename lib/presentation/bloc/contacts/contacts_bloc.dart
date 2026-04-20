import 'package:bloc/bloc.dart';
import 'package:example/domain/entities/contact_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/get_contacts_usecase.dart';

part 'contacts_bloc.freezed.dart';
part 'contacts_event.dart';
part 'contacts_state.dart';

@injectable
class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc(this._getContacts) : super(const ContactsState()) {
    on<ContactsEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(state.copyWith(status: ContactsStatus.loading));
          try {
            final contacts = await _getContacts();
            emit(
              state.copyWith(
                status: ContactsStatus.success,
                contacts: contacts,
                errorMessage: null,
              ),
            );
          } catch (e) {
            emit(
              state.copyWith(
                status: ContactsStatus.failure,
                errorMessage: e.toString(),
              ),
            );
          }
        },
      );
    });
  }

  final GetContactsUseCase _getContacts;
}
