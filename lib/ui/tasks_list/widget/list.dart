import 'package:flutter/material.dart';
import 'package:ne_kidaem_test/domain/models/task.dart';
import 'package:ne_kidaem_test/ui/constants.dart';
import 'package:ne_kidaem_test/ui/tasks_list/widget/task.dart';

import 'center_text.dart';

class CategoryList extends StatelessWidget {
  final List<Task> tasks;

  const CategoryList({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty ? _emptyList(context) : _list(tasks);
  }

  Widget _emptyList(BuildContext context) {
    return CenterText(
      'There are no tasks in this category.',
    );
  }

  Widget _list(List<Task> tasks) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => TaskItem(task: tasks[index]),
      ),
    );
  }
}
