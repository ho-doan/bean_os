import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/di/injection.dart';
import '../../domain/usecases/get_chat_usecase.dart';
import '../../domain/usecases/get_chats_usecase.dart';
import '../../domain/usecases/get_contact_usecase.dart';
import '../../domain/usecases/get_contacts_usecase.dart';
import '../../domain/usecases/get_profile_usecase.dart';
import '../../domain/usecases/login_usecase.dart';

final loginUseCaseProvider = Provider<LoginUseCase>((ref) => sl<LoginUseCase>());

final getChatsUseCaseProvider = Provider<GetChatsUseCase>(
  (ref) => sl<GetChatsUseCase>(),
);

final getChatUseCaseProvider =
    Provider<GetChatUseCase>((ref) => sl<GetChatUseCase>());

final getContactsUseCaseProvider = Provider<GetContactsUseCase>(
  (ref) => sl<GetContactsUseCase>(),
);

final getContactUseCaseProvider =
    Provider<GetContactUseCase>((ref) => sl<GetContactUseCase>());

final getProfileUseCaseProvider = Provider<GetProfileUseCase>(
  (ref) => sl<GetProfileUseCase>(),
);
