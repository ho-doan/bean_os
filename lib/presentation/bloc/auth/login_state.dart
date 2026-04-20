part of 'login_bloc.dart';

enum LoginStatus { initial, submitting, success, failure }

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoginStatus.initial) LoginStatus status,
    String? errorMessage,
  }) = _LoginState;
}
