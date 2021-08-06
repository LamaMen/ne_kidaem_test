import 'package:flutter/material.dart';
import 'package:ne_kidaem_test/ui/tasks_list/widget/list.dart';

import 'models/task.dart';

class TasksListPage extends StatelessWidget {
  static const route = 'list';
  final String title;
  final String token;

  final tasks = [
    Task(id: 1, title: 'task 1', category: TaskCategory.Approved),
    Task(id: 2, title: 'task 2', category: TaskCategory.InProgress),
    Task(id: 3, title: 'task 3', category: TaskCategory.NeedsReview),
    Task(id: 4, title: 'task 4', category: TaskCategory.OnHold),
    Task(id: 5, title: 'task 5', category: TaskCategory.NeedsReview),
    Task(id: 6, title: 'task 6', category: TaskCategory.Approved),
  ];

  TasksListPage(this.title, {Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('$title $token'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'On hold'),
              Tab(text: 'In progress'),
              Tab(text: 'Needs review'),
              Tab(text: 'Approved'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoryList(
              tasks: _selectTaskByCategory(TaskCategory.OnHold),
              isLoad: false,
            ),
            CategoryList(
              tasks: _selectTaskByCategory(TaskCategory.InProgress),
              isLoad: false,
            ),
            CategoryList(
              tasks: _selectTaskByCategory(TaskCategory.NeedsReview),
              isLoad: false,
            ),
            CategoryList(
              tasks: _selectTaskByCategory(TaskCategory.Approved),
              isLoad: false,
            ),
          ],
        ),
      ),
    );
  }

  List<Task> _selectTaskByCategory(TaskCategory category) {
    return tasks.where((task) => task.checkCategory(category)).toList();
  }
}
