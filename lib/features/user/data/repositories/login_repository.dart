import 'package:get/get.dart';

abstract class LoginApi {
  Future<Response> login(String email, String password);

  Future<Response> loginByToken(String token);
}
