import 'dart:convert';

import 'package:ne_kidaem_test/domain/exceptions/category.dart';

class Task {
  final int id;
  final String title;
  final TaskCategory category;

  Task({required this.id, required this.title, required this.category});

  bool checkCategory(TaskCategory category) => this.category == category;
}

enum TaskCategory { OnHold, InProgress, NeedsReview, Approved }

class JsonTask {
  final int id;
  final String row;
  final String title;

  JsonTask({required this.id, required this.row, required this.title});

  factory JsonTask.fromJson(Map<String, dynamic> json) {
    final bytes = Latin1Codec().encode(json['text']);
    return JsonTask(
      id: json['id'],
      row: json['row'],
      title: utf8.decode(bytes),
    );
  }

  Task toTask() => Task(id: id, category: _selectCategory(), title: title);

  TaskCategory _selectCategory() {
    if (row == '0') return TaskCategory.OnHold;
    if (row == '1') return TaskCategory.InProgress;
    if (row == '2') return TaskCategory.NeedsReview;
    if (row == '3') return TaskCategory.Approved;

    throw NoSuchCategoryException();
  }
}
