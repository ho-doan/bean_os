// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUserModel _$AuthUserModelFromJson(Map<String, dynamic> json) =>
    _AuthUserModel(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
    );

Map<String, dynamic> _$AuthUserModelToJson(_AuthUserModel instance) =>
    <String, dynamic>{'id': instance.id, 'username': instance.username};

_AuthLoginResponseModel _$AuthLoginResponseModelFromJson(
  Map<String, dynamic> json,
) => _AuthLoginResponseModel(
  accessToken: json['access_token'] as String,
  user: json['user'] == null
      ? null
      : AuthUserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthLoginResponseModelToJson(
  _AuthLoginResponseModel instance,
) => <String, dynamic>{
  'access_token': instance.accessToken,
  'user': instance.user,
};
