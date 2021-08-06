import 'package:flutter/material.dart';
import 'package:ne_kidaem_test/domain/models/task.dart';
import 'package:ne_kidaem_test/ui/constants.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ID: ${task.id}',
            style: TextStyle(fontSize: 12, color: Colors.white30),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            task.title,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
