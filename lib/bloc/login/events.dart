import 'package:flutter/foundation.dart';

@immutable
class LoginEvent {}

class DataEntered extends LoginEvent {
  final String username;
  final String password;

  DataEntered({required this.username, required this.password});
}
