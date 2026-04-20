import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/chat_model.dart';
import '../models/contact_model.dart';
import '../models/profile_model.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @GET('/profile')
  Future<ProfileModel> getProfile(@Query('id') String profileId);

  @GET('/contacts')
  Future<List<ContactModel>> getContacts();

  @GET('/contact')
  Future<ContactModel> getContact(@Query('id') String contactId);

  @GET('/chats')
  Future<List<ChatModel>> getChats();

  @GET('/chat')
  Future<ChatModel> getChat(@Query('id') String chatId);
}
