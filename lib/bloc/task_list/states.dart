import 'package:flutter/foundation.dart';
import 'package:ne_kidaem_test/domain/models/task.dart';

@immutable
class TaskListState {}

class TaskListInitial extends TaskListState {}

class TaskListLoad extends TaskListState {}

class TaskListFailure extends TaskListState {
  static const INTERNET_ERROR = 1;
  static const AUTH_ERROR = 2;
  final int code;

  TaskListFailure(this.code);

  factory TaskListFailure.internet() => TaskListFailure(INTERNET_ERROR);

  factory TaskListFailure.auth() => TaskListFailure(AUTH_ERROR);

  String get message {
    if (code == INTERNET_ERROR)
      return 'An error occurred while loading data. Check your internet connection or try again later.';
    if (code == AUTH_ERROR) return 'You are not allowed access to tasks.';
    return 'Error, try again later.';
  }
}

class TaskListSuccess extends TaskListState {
  final List<Task> tasks;

  TaskListSuccess(this.tasks);
}
