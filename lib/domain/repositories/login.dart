import 'dart:convert';

import 'package:ne_kidaem_test/domain/network/http_client.dart';
import 'package:universal_html/html.dart';

class LoginRepository {
  static const LOGIN_URL = '/api/v1/users';
  final HttpClient client;

  LoginRepository(this.client);

  Future<String> login(String username, String password) async {
    final url = LOGIN_URL + '/login/';
    final json = {
      'username': username,
      'password': password,
    };

    final response = await client.post(url, json);
    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      return json['token'];
    } else {
      throw UserUnauthorizedException();
    }
  }
}

class UserUnauthorizedException implements Exception {}
