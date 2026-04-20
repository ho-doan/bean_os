import 'package:example/data/datasources/app_local_data_source.dart';
import 'package:example/data/datasources/app_remote_data_source.dart';
import 'package:example/domain/repositories/auth_repository.dart';
import 'package:example/domain/repositories/chats_repository.dart';
import 'package:example/domain/repositories/contacts_repository.dart';
import 'package:example/domain/repositories/profile_repository.dart';
import 'package:example/domain/usecases/get_chat_usecase.dart';
import 'package:example/domain/usecases/get_chats_usecase.dart';
import 'package:example/domain/usecases/get_contact_usecase.dart';
import 'package:example/domain/usecases/get_contacts_usecase.dart';
import 'package:example/domain/usecases/get_profile_usecase.dart';
import 'package:example/domain/usecases/login_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

class MockContactsRepository extends Mock implements ContactsRepository {}

class MockChatsRepository extends Mock implements ChatsRepository {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAppRemoteDataSource extends Mock implements AppRemoteDataSource {}

class MockAppLocalDataSource extends Mock implements AppLocalDataSource {}

class MockGetProfileUseCase extends Mock implements GetProfileUseCase {}

class MockGetContactsUseCase extends Mock implements GetContactsUseCase {}

class MockGetContactUseCase extends Mock implements GetContactUseCase {}

class MockGetChatsUseCase extends Mock implements GetChatsUseCase {}

class MockGetChatUseCase extends Mock implements GetChatUseCase {}

class MockLoginUseCase extends Mock implements LoginUseCase {}
