import 'package:bloc/bloc.dart';
import 'package:example/domain/entities/chat_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/get_chats_usecase.dart';

part 'chats_bloc.freezed.dart';
part 'chats_event.dart';
part 'chats_state.dart';

@injectable
class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc(this._getChats) : super(const ChatsState()) {
    on<ChatsEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(state.copyWith(status: ChatsStatus.loading));
          try {
            final chats = await _getChats();
            emit(
              state.copyWith(
                status: ChatsStatus.success,
                chats: chats,
                errorMessage: null,
              ),
            );
          } catch (e) {
            emit(
              state.copyWith(
                status: ChatsStatus.failure,
                errorMessage: e.toString(),
              ),
            );
          }
        },
      );
    });
  }

  final GetChatsUseCase _getChats;
}
