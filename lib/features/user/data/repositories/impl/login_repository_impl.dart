import 'package:get/get.dart';
import 'package:meowdify/features/user/data/repositories/login_repository.dart';

class LoginApiImpl extends GetConnect implements LoginApi {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://127.0.0.1:3000';
    httpClient.timeout = const Duration(seconds: 10);
    super.onInit();
  }

  @override
  Future<Response> login(String email, String password) async {
    try {
      final response =
          await post('/login', {'email': email, 'password': password});
      return errorCheck("login", response);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Response> loginByToken(String token) async {
    try {
      print("logining by token");
      final response = await post('/login_by_token', {'token': token});

      return errorCheck("loginByToken", response);
    } catch (e) {
      throw Exception(e);
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
