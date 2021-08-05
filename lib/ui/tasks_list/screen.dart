import 'package:flutter/material.dart';

class TasksListPage extends StatelessWidget {
  static const route = 'list';
  final String title;
  const TasksListPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('List')),
    );
  }
}
