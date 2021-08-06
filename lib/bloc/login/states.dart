import 'package:flutter/foundation.dart';

@immutable
class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoad extends LoginState {}

class LoginWrongData extends LoginState {}

class LoginCorrect extends LoginState {
  final String token;

  LoginCorrect(this.token);
}