import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_login_request_model.freezed.dart';
part 'auth_login_request_model.g.dart';

@freezed
abstract class AuthLoginRequestModel with _$AuthLoginRequestModel {
  const factory AuthLoginRequestModel({
    required String username,
    required String password,
  }) = _AuthLoginRequestModel;

  factory AuthLoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginRequestModelFromJson(json);
}
