import 'package:flutter/foundation.dart';
import 'package:ne_kidaem_test/domain/models/task.dart';

@immutable
class TaskListState {}

class TaskListInitial extends TaskListState {}

class TaskListLoad extends TaskListState {}

class TaskListFailure extends TaskListState {}

class TaskListSuccess extends TaskListState {
  final List<Task> tasks;

  TaskListSuccess(this.tasks);
}