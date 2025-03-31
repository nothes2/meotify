import 'package:get/get_connect/http/src/response/response.dart';
import 'package:meowdify/features/user/data/repositories/login_repository.dart';

class LoginUseCase {
  final LoginApi loginApi;

  LoginUseCase(this.loginApi);

  Future<Response> call(String username, String password) {
    return loginApi.login(username, password);
  }
}
