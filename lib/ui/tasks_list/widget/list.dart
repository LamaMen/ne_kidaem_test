import 'package:flutter/material.dart';
import 'package:ne_kidaem_test/ui/constants.dart';
import 'package:ne_kidaem_test/ui/tasks_list/models/task.dart';
import 'package:ne_kidaem_test/ui/tasks_list/widget/task.dart';

class CategoryList extends StatelessWidget {
  final List<Task>? tasks;
  final bool isLoad;

  const CategoryList({Key? key, this.isLoad = false, this.tasks})
      : assert(isLoad || tasks != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoad ? _load() : _list();
  }

  Widget _load() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _list() {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: ListView.builder(
        itemCount: tasks!.length,
        itemBuilder: (context, index) => TaskItem(task: tasks![index]),
      ),
    );
  }
}
