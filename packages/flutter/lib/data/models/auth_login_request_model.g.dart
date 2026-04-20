// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthLoginRequestModel _$AuthLoginRequestModelFromJson(
  Map<String, dynamic> json,
) => _AuthLoginRequestModel(
  username: json['username'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$AuthLoginRequestModelToJson(
  _AuthLoginRequestModel instance,
) => <String, dynamic>{
  'username': instance.username,
  'password': instance.password,
};
