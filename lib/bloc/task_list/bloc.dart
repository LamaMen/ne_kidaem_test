import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_kidaem_test/bloc/task_list/events.dart';
import 'package:ne_kidaem_test/bloc/task_list/states.dart';
import 'package:ne_kidaem_test/domain/models/task.dart';

class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  TaskListBloc() : super(TaskListInitial());

  final tasks = [
    Task(id: 1, title: 'task 1', category: TaskCategory.Approved),
    Task(id: 2, title: 'task 2', category: TaskCategory.InProgress),
    Task(id: 3, title: 'task 3', category: TaskCategory.NeedsReview),
    Task(id: 4, title: 'task 4', category: TaskCategory.OnHold),
    Task(id: 5, title: 'task 5', category: TaskCategory.NeedsReview),
    Task(id: 6, title: 'task 6', category: TaskCategory.Approved),
  ];

  @override
  Stream<TaskListState> mapEventToState(TaskListEvent event) async* {
    if (event is TaskBeginLoad) {
      emit(TaskListLoad());
      await Future.delayed(Duration(seconds: 1)); // send request
      // emit(TaskListSuccess(tasks));
      emit(TaskListFailure());
    }
  }
}
