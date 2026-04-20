// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api/app_api.dart' as _i715;
import '../../data/datasources/app_local_data_source.dart' as _i1002;
import '../../data/datasources/app_remote_data_source.dart' as _i230;
import '../../data/local/app_database.dart' as _i293;
import '../../data/repositories/auth_repository_impl.dart' as _i895;
import '../../data/repositories/chats_repository_impl.dart' as _i238;
import '../../data/repositories/contacts_repository_impl.dart' as _i399;
import '../../data/repositories/profile_repository_impl.dart' as _i813;
import '../../domain/repositories/auth_repository.dart' as _i1073;
import '../../domain/repositories/chats_repository.dart' as _i685;
import '../../domain/repositories/contacts_repository.dart' as _i219;
import '../../domain/repositories/profile_repository.dart' as _i47;
import '../../domain/usecases/get_chat_usecase.dart' as _i254;
import '../../domain/usecases/get_chats_usecase.dart' as _i345;
import '../../domain/usecases/get_contact_usecase.dart' as _i1021;
import '../../domain/usecases/get_contacts_usecase.dart' as _i237;
import '../../domain/usecases/get_profile_usecase.dart' as _i749;
import '../../domain/usecases/login_usecase.dart' as _i253;
import '../../presentation/bloc/auth/login_bloc.dart' as _i539;
import '../../presentation/bloc/chat_detail/chat_detail_bloc.dart' as _i42;
import '../../presentation/bloc/chats/chats_bloc.dart' as _i829;
import '../../presentation/bloc/contact_detail/contact_detail_bloc.dart'
    as _i585;
import '../../presentation/bloc/contacts/contacts_bloc.dart' as _i897;
import '../../presentation/bloc/profile/profile_bloc.dart' as _i636;
import '../../presentation/bloc/profile_detail/profile_detail_bloc.dart'
    as _i980;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i293.AppDatabase>(() => _i293.AppDatabase());
    gh.lazySingleton<_i1073.AuthRepository>(() => _i895.AuthRepositoryImpl());
    gh.lazySingleton<_i715.AppApi>(
      () => registerModule.appApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i230.AppRemoteDataSource>(
      () => _i230.AppRemoteDataSourceImpl(gh<_i715.AppApi>()),
    );
    gh.lazySingleton<_i253.LoginUseCase>(
      () => _i253.LoginUseCase(gh<_i1073.AuthRepository>()),
    );
    gh.lazySingleton<_i1002.AppLocalDataSource>(
      () => _i1002.AppLocalDataSourceImpl(gh<_i293.AppDatabase>()),
    );
    gh.lazySingleton<_i685.ChatsRepository>(
      () => _i238.ChatsRepositoryImpl(
        gh<_i230.AppRemoteDataSource>(),
        gh<_i1002.AppLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i254.GetChatUseCase>(
      () => _i254.GetChatUseCase(gh<_i685.ChatsRepository>()),
    );
    gh.lazySingleton<_i345.GetChatsUseCase>(
      () => _i345.GetChatsUseCase(gh<_i685.ChatsRepository>()),
    );
    gh.lazySingleton<_i219.ContactsRepository>(
      () => _i399.ContactsRepositoryImpl(
        gh<_i230.AppRemoteDataSource>(),
        gh<_i1002.AppLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i47.ProfileRepository>(
      () => _i813.ProfileRepositoryImpl(
        gh<_i230.AppRemoteDataSource>(),
        gh<_i1002.AppLocalDataSource>(),
      ),
    );
    gh.factory<_i539.LoginBloc>(
      () => _i539.LoginBloc(gh<_i253.LoginUseCase>()),
    );
    gh.lazySingleton<_i749.GetProfileUseCase>(
      () => _i749.GetProfileUseCase(gh<_i47.ProfileRepository>()),
    );
    gh.factory<_i636.ProfileBloc>(
      () => _i636.ProfileBloc(gh<_i749.GetProfileUseCase>()),
    );
    gh.lazySingleton<_i1021.GetContactUseCase>(
      () => _i1021.GetContactUseCase(gh<_i219.ContactsRepository>()),
    );
    gh.lazySingleton<_i237.GetContactsUseCase>(
      () => _i237.GetContactsUseCase(gh<_i219.ContactsRepository>()),
    );
    gh.factory<_i829.ChatsBloc>(
      () => _i829.ChatsBloc(gh<_i345.GetChatsUseCase>()),
    );
    gh.factory<_i897.ContactsBloc>(
      () => _i897.ContactsBloc(gh<_i237.GetContactsUseCase>()),
    );
    gh.factoryParam<_i42.ChatDetailBloc, String, dynamic>(
      (chatId, _) => _i42.ChatDetailBloc(gh<_i254.GetChatUseCase>(), chatId),
    );
    gh.factoryParam<_i980.ProfileDetailBloc, String, dynamic>(
      (profileId, _) =>
          _i980.ProfileDetailBloc(gh<_i749.GetProfileUseCase>(), profileId),
    );
    gh.factoryParam<_i585.ContactDetailBloc, String, dynamic>(
      (contactId, _) =>
          _i585.ContactDetailBloc(gh<_i1021.GetContactUseCase>(), contactId),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
