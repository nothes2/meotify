import 'package:get/get.dart';
import 'package:meowdify/features/user/data/repositories/register_repository.dart';

class RegisterUsecase {
  final RegisterApi registerApi;

  RegisterUsecase(this.registerApi);

  Future<Response> call(String username, String email, String password) {
    return registerApi.register(username, email, password);
  }

  Future<Response> usernameCheck(String username) {
    return registerApi.usernameCheck(username);
  }

  Future<Response> emailCheck(String email) {
    return registerApi.emailCheck(email);
  }
}
