import 'package:get/get.dart';
import 'package:meowdify/features/user/data/repositories/register_repository.dart';

class RegisterApiImpl extends GetConnect implements RegisterApi {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://127.0.0.1:3000';
    httpClient.timeout = const Duration(seconds: 10);
    super.onInit();
  }

  @override
  Future<Response> emailCheck(String email) async {
    try {
      final response = await post('/email_check', {"email": email});

      return errorCheck("check email", response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> register(
      String username, String email, String password) async {
    final response = await post('/register',
        {"username": username, "email": email, "password": password});
    try {
      return errorCheck("register", response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> usernameCheck(String username) async {
    try {
      final response = await post('/username_check', {"username": username});
      return errorCheck("check username", response);
    } catch (e) {
      rethrow;
    }
  }
}

Response errorCheck(String label, Response response) {
  if (response.isOk) {
    return response;
  } else {
    throw Exception('Failed to $label: ${response.statusText}');
  }
}
