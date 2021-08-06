import 'package:flutter/foundation.dart';

@immutable
class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoad extends LoginState {}

class LoginFailure extends LoginState {
  static const INTERNET_ERROR_CODE = 1;
  static const AUTH_ERROR_CODE = 2;
  final int code;

  LoginFailure(this.code);

  factory LoginFailure.internet() => LoginFailure(INTERNET_ERROR_CODE);

  factory LoginFailure.auth() => LoginFailure(AUTH_ERROR_CODE);

  String get message {
    if (code == INTERNET_ERROR_CODE)
      return 'Network error, check internet or try again later.';
    if (code == AUTH_ERROR_CODE)
      return 'Invalid user data, check username or password.';
    return 'Error, try again later.';
  }
}

class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess(this.token);
}
