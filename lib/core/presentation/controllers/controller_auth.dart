import 'dart:convert';

import 'package:get/get.dart';
import 'package:meowdify/core/domain/entities/en_user.dart';
import 'package:meowdify/core/utilities/flutter_secure_storage_repo_impl.dart';
import 'package:meowdify/features/user/data/repositories/impl/login_repository_impl.dart';
import 'package:meowdify/features/user/domain/usecases/login_usecase.dart';
import 'package:meowdify/features/user/presentation/controller/controller_login.dart';
import 'package:meowdify/features/user/presentation/pages/page_login.dart';

class AuthController extends GetxController {
  final SecureStorageRepositoryImpl storage = Get.find();
  var isAuthenticated = false.obs;
  var isLoading = true.obs;
  Rxn<User> user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    _checkAuth();
    loadUserInfo();
  }

  Future<void> loadUserInfo() async {
    Get.put(SecureStorageRepositoryImpl());
    final SecureStorageRepositoryImpl storage = Get.find();
    String userJson = await storage.getData("user");

    Map<String, dynamic> userData = jsonDecode(userJson);
    if (userData.isNotEmpty) {
      user.value = User(username: userData["username"], pfp: userData["pfp"]);
    }
  }

  Future<void> logout() async {
    Get.put(SecureStorageRepositoryImpl());
    final SecureStorageRepositoryImpl storage = Get.find();
    await storage.deleteData("user");
    user.value = null;
    Get.dialog(const LoginFrame());
  }

  Future<void> _checkAuth() async {
    Get.put(SecureStorageRepositoryImpl());
    Get.put(LoginApiImpl());
    Get.put(LoginUseCase(Get.find<LoginApiImpl>()));
    Get.put(LoginController(Get.find()));
    final login = Get.find<LoginController>();
    final storage = Get.find<SecureStorageRepositoryImpl>();
    try {
      final token = await storage.getData("jwt_token");
      isAuthenticated.value = token != null;
      if (token == null) {
        isAuthenticated.value = false;
        return;
      }
      isAuthenticated.value = await login.loginByToken();
    } catch (e) {
      isAuthenticated.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
