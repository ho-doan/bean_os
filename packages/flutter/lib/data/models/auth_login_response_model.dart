import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_login_response_model.freezed.dart';
part 'auth_login_response_model.g.dart';

@freezed
abstract class AuthUserModel with _$AuthUserModel {
  const factory AuthUserModel({
    required int id,
    required String username,
  }) = _AuthUserModel;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);
}

@freezed
abstract class AuthLoginResponseModel with _$AuthLoginResponseModel {
  const factory AuthLoginResponseModel({
    @JsonKey(name: 'access_token') required String accessToken,
    AuthUserModel? user,
  }) = _AuthLoginResponseModel;

  factory AuthLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginResponseModelFromJson(json);
}
