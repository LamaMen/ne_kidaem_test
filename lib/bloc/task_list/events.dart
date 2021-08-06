import 'package:flutter/foundation.dart';

@immutable
class TaskListEvent {}

class TaskBeginLoad extends TaskListEvent {
  final String token;

  TaskBeginLoad(this.token);
}