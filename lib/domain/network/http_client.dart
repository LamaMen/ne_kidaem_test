import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:ne_kidaem_test/domain/network/uri_builder.dart';

class HttpClient {
  final _builder = UriBuilder();
  final _headers = {
    HttpHeaders.contentTypeHeader: "application/json",
  };

  Future<http.Response> get(String path, String token) async {
    try {
      final headers = Map<String, String>.from(_headers)
        ..addAll({'Authorization': 'JWT $token'});

      return http.get(_builder.withoutParams(path), headers: headers);
    } catch (e) {
      throw RequestException();
    }
  }

  Future<http.Response> post(String path, Map<String, dynamic> json) async {
    try {
      final url = _builder.withoutParams(path);
      return http.post(
        url,
        headers: _headers,
        body: jsonEncode(json),
      );
    } catch (e) {
      throw RequestException();
    }
  }
}

class RequestException implements Exception {}
