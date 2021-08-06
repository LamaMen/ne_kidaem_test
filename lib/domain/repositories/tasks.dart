import 'dart:convert';

import 'package:http/http.dart';
import 'package:ne_kidaem_test/domain/exceptions/user.dart';
import 'package:ne_kidaem_test/domain/models/task.dart';
import 'package:ne_kidaem_test/domain/network/http_client.dart';
import 'package:universal_html/html.dart';

class TaskRepository {
  static const TASKS_URL = '/cards';
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
