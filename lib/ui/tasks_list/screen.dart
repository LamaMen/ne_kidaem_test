import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_kidaem_test/bloc/task_list/bloc.dart';
import 'package:ne_kidaem_test/bloc/task_list/events.dart';
import 'package:ne_kidaem_test/bloc/task_list/states.dart';
import 'package:ne_kidaem_test/domain/models/task.dart';
import 'package:ne_kidaem_test/ui/tasks_list/widget/center_text.dart';
import 'package:ne_kidaem_test/ui/tasks_list/widget/list.dart';

class TasksListPage extends StatelessWidget {
  static const route = 'list';
  final String title;
  final String token;

  TasksListPage(this.title, {Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TaskListBloc>(context);
    bloc.add(TaskBeginLoad(token));

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('$title'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'On hold'),
              Tab(text: 'In progress'),
              Tab(text: 'Needs review'),
              Tab(text: 'Approved'),
            ],
          ),
        ),
        body: BlocBuilder<TaskListBloc, TaskListState>(
          builder: (context, state) {
            late List<Widget> children;

            if (state is TaskListInitial) children = _list(List.empty());
            if (state is TaskListSuccess) children = _list(state.tasks);
            if (state is TaskListLoad) children = _load();
            if (state is TaskListFailure) children = _failure(state.message);

            return TabBarView(children: children);
          },
        ),
        //
      ),
    );
  }

  List<Widget> _failure(String message) {
    return _generateTabs((index) => CenterText(message));
  }

  List<Widget> _load() {
    return _generateTabs((index) => Center(child: CircularProgressIndicator()));
  }

  List<Widget> _list(List<Task> tasks) {
    return _generateTabs((index) => CategoryList(
        tasks: _selectTaskByCategory(tasks, TaskCategory.values[index])));
  }

  List<Widget> _generateTabs(Widget generator(int index)) {
    return List.generate(4, generator);
  }

  List<Task> _selectTaskByCategory(List<Task> tasks, TaskCategory category) {
    return tasks.where((task) => task.checkCategory(category)).toList();
  }
}
