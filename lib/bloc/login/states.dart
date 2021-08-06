import 'package:flutter/foundation.dart';

@immutable
class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoad extends LoginState {}

class LoginFailure extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess(this.token);
}