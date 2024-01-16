import 'dart:convert';


import 'package:employee_management/model/login_request_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  Future<Map<String, dynamic>> login(LoginRequestModel loginRequest) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        body: loginRequest.toJson(),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {'success': true, 'token': data['token']};
      } else {
        return {'success': false, 'error': 'Login failed'};
      }
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }
}