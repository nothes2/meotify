import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meowdify/features/user/domain/usecases/register_usecase.dart';
import 'package:meowdify/features/user/presentation/controller/controller_debounce.dart';
import 'package:meowdify/features/user/presentation/pages/page_login.dart';

class RegisterController extends GetxController {
  var errorMessage = "".obs;
  var username = "".obs;
  var email = "".obs;
  var password = "".obs;
  var confirmPassword = "".obs;
  RxBool disable = true.obs;

  var usernameError = "".obs;
  var emailError = "".obs;
  var passwordError = "".obs;
  var confirmPasswordError = "".obs;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final RegisterUsecase registerUsecase;
  final DebounceController debounceController = Get.put(DebounceController());

  RegisterController(this.registerUsecase);
  void validateUsername(String value) async {
    username.value = value;
    usernameError.value = "";
    isButtonEanbled();
    if (value.isEmpty) {
      usernameError.value = "Username cannot be empty!";
      return;
    } else if (value.length < 6 || value.length > 20) {
      usernameError.value = "Username must be between 6 and 20 characters!";
      return;
    }

    try {
      Response response = await registerUsecase.usernameCheck(value);
      if (response.body != null && response.body['success'] == false) {
        usernameError.value = "Username has already been used!";
      }
      isButtonEanbled();
    } catch (e) {
      usernameError.value = "An error occurred while checking the username!";
    }
  }

  void validateEmail(String value) async {
    email.value = value;
    emailError.value = "";

    if (value.isEmpty) {
      emailError.value = "Email cannot be empty!";
      isButtonEanbled();
      return;
    }

    if (!isValidEmail(value)) {
      emailError.value = "Invalid email format!";
      isButtonEanbled();
      return;
    }

    try {
      Response response = await registerUsecase.emailCheck(value);
      if (response.body != null && response.body['success'] == false) {
        emailError.value = "Email is already in use!";
      }
      isButtonEanbled();
    } catch (e) {
      emailError.value = "An error occurred while checking the email!";
    }
  }

  void validatePassword(String value) {
    password.value = value;
    passwordError.value = "";
    passwordError.value = value.isEmpty
        ? "Password cannot be empty!"
        : (!containsLetter(value))
            ? "Password must contain at least one letter!"
            : (value.length < 6)
                ? "Password must be at least 6 characters long!"
                : "";
    isButtonEanbled();
  }

  void validateConfirmPassword(String value) {
    confirmPassword.value = value;
    confirmPassword.value = "";
    confirmPasswordError.value =
        value != password.value ? "Passwords do not match!" : "";
    isButtonEanbled();
  }

  void onValueChanged(String value, String fieldName) {
    final validationMap = {
      'username': validateUsername,
      'email': validateEmail,
      'password': validatePassword,
      'confirmPassword': validateConfirmPassword,
    };
    isButtonEanbled();
    final validationFunction = validationMap[fieldName];
    if (validationFunction != null) {
      debounceController.debounceInput(value, validationFunction);
    }
  }

  isButtonEanbled() {
    if (usernameError.isNotEmpty ||
        emailError.isNotEmpty ||
        passwordError.isNotEmpty ||
        confirmPasswordError.isNotEmpty) {
      disable.value = true;
    } else {
      disable.value = false;
    }

    return disable;
  }

  void clearForm() {
    username.value = "";
    email.value = "";
    password.value = "";
    confirmPassword.value = "";

    usernameError.value = "";
    emailError.value = "";
    passwordError.value = "";
    confirmPasswordError.value = "";

    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    isButtonEanbled();
    disable.value = true;
  }

  Future<void> submitForm() async {
    if (disable.value) {
      return;
    }

    try {
      final response = await registerUsecase.call(
          username.value, email.value, password.value);

      if (response.body != null && response.body['success'] == true) {
        clearForm();
        Get.snackbar("Success", "Registration successful!",
            snackPosition: SnackPosition.BOTTOM);
        Get.back();
        Get.dialog(const LoginFrame());
      } else {
        errorMessage.value =
            response.body?['message'] ?? "Registration failed!";
        Get.snackbar("Error", errorMessage.value,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      errorMessage.value = "An error occurred during registration!";
      Get.snackbar("Error", errorMessage.value,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

bool isValidEmail(String email) {
  const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  return RegExp(pattern).hasMatch(email);
}

bool containsLetter(String input) {
  return RegExp(r'[a-zA-Z]').hasMatch(input);
}
