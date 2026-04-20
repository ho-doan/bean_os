import 'package:bloc/bloc.dart';
import 'package:example/domain/entities/chat_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/get_chat_usecase.dart';

part 'chat_detail_bloc.freezed.dart';
part 'chat_detail_event.dart';
part 'chat_detail_state.dart';

@injectable
class ChatDetailBloc extends Bloc<ChatDetailEvent, ChatDetailState> {
  ChatDetailBloc(this._getChat, @factoryParam this.chatId)
    : super(const ChatDetailState()) {
    on<ChatDetailEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(state.copyWith(status: ChatDetailStatus.loading));
          try {
            final chat = await _getChat(chatId);
            emit(
              state.copyWith(
                status: ChatDetailStatus.success,
                chat: chat,
                errorMessage: null,
              ),
            );
          } catch (e) {
            emit(
              state.copyWith(
                status: ChatDetailStatus.failure,
                errorMessage: e.toString(),
              ),
            );
          }
        },
      );
    });
  }

  final GetChatUseCase _getChat;
  final String chatId;
}
