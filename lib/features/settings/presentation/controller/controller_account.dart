import 'dart:convert';

import 'package:get/get.dart';
import 'package:meowdify/core/domain/entities/en_user.dart';
import 'package:meowdify/core/utilities/flutter_secure_storage_repo_impl.dart';
import 'package:meowdify/features/user/presentation/pages/page_login.dart';

class AccountController extends GetxController {
  final user = User().obs;
  final storage = Get.put(SecureStorageRepositoryImpl());
  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  Future<void> getUser() async {
    user.value = User.fromJson(jsonDecode(await storage.getData("user")));

    if (user.value.id == null) {
      Get.snackbar("Error".tr, "Cannot find user data!");
      return;
    }
  }

  Future<void> logout() async {
    Get.put(SecureStorageRepositoryImpl());
    final SecureStorageRepositoryImpl storage = Get.find();
    await storage.deleteData("user");
    await storage.deleteData("token");

    Get.snackbar("Success".tr, "logout successful".tr);
  }
}
