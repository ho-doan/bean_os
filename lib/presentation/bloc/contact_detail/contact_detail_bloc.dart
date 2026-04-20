import 'package:bloc/bloc.dart';
import 'package:example/domain/entities/contact_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/get_contact_usecase.dart';

part 'contact_detail_bloc.freezed.dart';
part 'contact_detail_event.dart';
part 'contact_detail_state.dart';

@injectable
class ContactDetailBloc extends Bloc<ContactDetailEvent, ContactDetailState> {
  ContactDetailBloc(this._getContact, @factoryParam this.contactId)
    : super(const ContactDetailState()) {
    on<ContactDetailEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(state.copyWith(status: ContactDetailStatus.loading));
          try {
            final contact = await _getContact(contactId);
            emit(
              state.copyWith(
                status: ContactDetailStatus.success,
                contact: contact,
                errorMessage: null,
              ),
            );
          } catch (e) {
            emit(
              state.copyWith(
                status: ContactDetailStatus.failure,
                errorMessage: e.toString(),
              ),
            );
          }
        },
      );
    });
  }

  final GetContactUseCase _getContact;
  final String contactId;
}
