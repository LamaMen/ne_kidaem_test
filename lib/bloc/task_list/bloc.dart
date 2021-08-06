import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_kidaem_test/bloc/task_list/events.dart';
import 'package:ne_kidaem_test/bloc/task_list/states.dart';
import 'package:ne_kidaem_test/domain/exceptions/user.dart';
import 'package:ne_kidaem_test/domain/repositories/tasks.dart';

class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  final TaskRepository repository;

  TaskListBloc(this.repository) : super(TaskListInitial());

  @override
  Stream<TaskListState> mapEventToState(TaskListEvent event) async* {
    if (event is TaskBeginLoad) {
      try {
        emit(TaskListLoad());
        final tasks = await repository.updateTasks(event.token);
        emit(TaskListSuccess(tasks));
      } on UserUnauthorizedException {
        emit(TaskListFailure.auth());
      } catch (e) {
        emit(TaskListFailure.internet());
      }
    }
  }
}
