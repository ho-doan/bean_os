import 'package:injectable/injectable.dart';

import '../api/app_api.dart';
import '../models/chat_model.dart';
import '../models/contact_model.dart';
import '../models/profile_model.dart';

abstract class AppRemoteDataSource {
  Future<ProfileModel> fetchProfile(String profileId);

  Future<List<ContactModel>> fetchContacts();

  Future<ContactModel> fetchContact(String contactId);

  Future<List<ChatModel>> fetchChats();

  Future<ChatModel> fetchChat(String chatId);
}

/// Remote API via [Dio] + [Retrofit]; responses are mocked by [AssetApiMocksInterceptor]
/// from JSON route files under `assets/api_mocks/` (dio_mock_interceptor–compatible schema).
@LazySingleton(as: AppRemoteDataSource)
class AppRemoteDataSourceImpl implements AppRemoteDataSource {
  AppRemoteDataSourceImpl(this._api);

  final AppApi _api;

  @override
  Future<ProfileModel> fetchProfile(String profileId) =>
      _api.getProfile(profileId);

  @override
  Future<List<ContactModel>> fetchContacts() => _api.getContacts();

  @override
  Future<ContactModel> fetchContact(String contactId) =>
      _api.getContact(contactId);

  @override
  Future<List<ChatModel>> fetchChats() => _api.getChats();

  @override
  Future<ChatModel> fetchChat(String chatId) => _api.getChat(chatId);
}
