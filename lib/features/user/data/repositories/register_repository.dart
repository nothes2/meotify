import 'package:get/get.dart';

abstract class RegisterApi {
  Future<Response> register(String username, String email, String password);
  Future<Response> usernameCheck(String username);
  Future<Response> emailCheck(String email);
}
