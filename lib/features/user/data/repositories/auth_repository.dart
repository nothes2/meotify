import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepository {
  final String apiUrl = 'https://example.com/api';

  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Handle successful login
      return true;
    } else {
      // Handle login failure
      return false;
    }
  }
}
