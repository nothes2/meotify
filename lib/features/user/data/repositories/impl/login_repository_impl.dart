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
      if (response.isOk) {
        return response;
      } else {
        throw Exception(
            'Login failed with status: ${response.statusCode}, message: ${response.body["message"]}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
