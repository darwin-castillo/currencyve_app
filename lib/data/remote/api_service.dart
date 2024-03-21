import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl;
  final Map<String, String> _headers = {'Content-Type': 'application/json'};
  ApiService(this._baseUrl);

  Future<http.Response> post(
      {String? baseUrl,
      required String endpoint,
      Map? body,
      Map<String, String>? headers,
      Map<String, dynamic>? params}) async {
    Uri uri = Uri.https(baseUrl ?? _baseUrl, endpoint, params);
    String _body = json.encode(body);
    final response = await http.post(
      uri,
      headers: headers ?? _headers,
      body: _body,
    );

    return response;
  }

  Future<http.Response> get(
      {String? baseUrl,
      required String endpoint,
      Map<String, String>? headers,
      Map<String, dynamic>? params}) async {
    Uri uri = Uri.https(baseUrl ?? _baseUrl, endpoint, params);

    final response = await http.get(
      uri,
      headers: headers ?? _headers,
    );

    return response;
  }

  Future<http.Response> put(
      {String? baseUrl,
      required String endpoint,
      Map? body,
      Map<String, String>? headers,
      Map<String, dynamic>? params}) async {
    Uri uri = Uri.https(baseUrl ?? _baseUrl, endpoint, params);
    String _body = json.encode(body);
    final response = await http.put(
      uri,
      headers: headers ?? _headers,
      body: _body,
    );

    return response;
  }

  Future<http.Response> delete(
      {String? baseUrl,
      required String endpoint,
      Map<String, String>? headers,
      Map<String, dynamic>? params}) async {
    Uri uri = Uri.https(baseUrl ?? _baseUrl, endpoint, params);

    final response = await http.delete(
      uri,
      headers: headers ?? _headers,
    );

    return response;
  }
}
