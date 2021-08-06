import 'package:flutter/foundation.dart';

@immutable
class LoginEvent {}

class OnDataEntered extends LoginEvent {
  final String username;
  final String password;

  OnDataEntered({required this.username, required this.password});
}
