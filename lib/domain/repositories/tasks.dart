import 'dart:convert';

import 'package:http/http.dart';
import 'package:ne_kidaem_test/domain/models/task.dart';
import 'package:ne_kidaem_test/domain/network/http_client.dart';
import 'package:ne_kidaem_test/domain/repositories/login.dart';
import 'package:universal_html/html.dart';

class TaskRepository {
  static const TASKS_URL = '/api/v1/cards';
  final HttpClient client;
  final List<Task> _tasks = [];

  TaskRepository(this.client);

  Future<List<Task>> updateTasks(String token) async {
    final url = TASKS_URL + '/';
    final response = await client.get(url, token);
    if (response.statusCode == HttpStatus.ok) {
      _updateTasks(response);
      return _tasks;
    } else {
      throw UserUnauthorizedException();
    }
  }

  void _updateTasks(Response response) {
    final jsons = _parseBody(response);
    _tasks
      ..clear()
      ..addAll(jsons.map((json) => json.toTask()));
  }

  Iterable<JsonTask> _parseBody(Response response) {
    final body = jsonDecode(response.body) as Iterable;
    return body.map((json) {
      return JsonTask.fromJson(json);
    });
  }
}

// TODO - separate in new file

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

class NoSuchCategoryException implements Exception {}
