import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/utilities/flutter_secure_storage_repo_impl.dart';
import 'package:meowdify/features/user/domain/usecases/login_usecase.dart';
import 'package:meowdify/features/user/presentation/controller/controller_debounce.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  final DebounceController debounceController = Get.put(DebounceController());
  LoginController(this.loginUseCase);

  // Observables
  var errorMessage = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  var emailError = ''.obs;
  var passwordError = ''.obs;

  // TextEditingControllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // Validation methods
  void validateEmail(String value) {
    email.value = value;
    emailError.value = value.isEmpty ? "Email cannot be empty" : "";
  }

  void validatePassword(String value) {
    password.value = value;
    passwordError.value = value.isEmpty ? "Password cannot be empty" : "";
  }

  void onValueChanged(String value, String fieldName) {
    final validationMap = {
      'email': validateEmail,
      'password': validatePassword,
    };

    final validate = validationMap[fieldName];
    if (validate != null) {
      debounceController.debounceInput(value, validate);
    }
  }

  bool isButtonDisable() {
    if (emailError.isEmpty && passwordError.isEmpty) {
      return false;
    }

    return true;
  }

  Future<bool> login() async {
    errorMessage.value = "";

    if (email.value.isEmpty) emailError.value = "Email cannot be empty";
    if (password.value.isEmpty) {
      passwordError.value = "Password cannot be empty";
    }

    if (emailError.isNotEmpty || passwordError.isNotEmpty) return false;

    final response = await loginUseCase(email.value, password.value);

    var data = response.body["data"];
    var token = data?["token"];

    if (token == null) {
      errorMessage.value = response.body['message'] ?? 'Login failed';
      return false;
    }

    final stroage = Get.find<SecureStorageRepositoryImpl>();

    stroage.saveData("jwt_token", token);
    Map<String, dynamic> userData = response.body['data']['user'];
    await stroage.saveData("user", jsonEncode(userData));
    Get.back();
    Get.snackbar("Login Successful!", "Welcome to meotify!",
        backgroundColor: Colors.green, colorText: Colors.white);
    return response.body['success'] ?? false;
  }

  Future<bool> loginByToken() async {
    final storage = Get.find<SecureStorageRepositoryImpl>();
    final token = await storage.getData("jwt_token");
    if (token == null) {
      return false;
    }

    final response = await loginUseCase.loginByToken(token);
    if (response.body['data'] == null) {
      return false;
    }

    Map<String, dynamic> data = response.body['data']['user'];
    await storage.saveData("user", jsonEncode(data));
    return true;
  }
}
