import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/domain/entities/en_user.dart';
import 'package:meowdify/core/utilities/flutter_secure_storage_repo_impl.dart';
import 'package:meowdify/core/utilities/general.dart';
import 'package:meowdify/features/settings/data/repository/repo_account.dart';

class AccountController extends GetxController {
  final user = User().obs;
  final storage = Get.put(SecureStorageRepositoryImpl());
  var isHovering = false.obs;
  final accountRepo = Get.put(AccountRepository());

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  void mouseEnter() {
    isHovering.value = true;
  }

  void mouseExit() {
    isHovering.value = false;
  }

  Future<void> uploadPfp() async {
    final file = await pickSingleFile(FileType.image);

    if (file == null) {
      Get.snackbar("Error".tr, "File Operation Error".tr);
      return;
    }

    final response =
        await accountRepo.uploadPfp(File(file.path!), user.value.id ?? "");

    final flag = response.body['success'];

    if (!flag) {
      Get.snackbar("Error".tr, "Upload Failed");
      return;
    }

    Get.snackbar("Success", "Upload Profile Picture successfully!");
    getUser();
  }

  Future<void> getUser() async {
    user.value = User.fromJson(jsonDecode(await storage.getData("user")));
    print("pfp: ${user.value.pfp}");
    if (user.value.id == null) {
      Get.snackbar("Error".tr, "Cannot find user data, login first!");
      return;
    }

    final response = await accountRepo.getUser(user.value.id ?? "");

    if (response.body['data'] == null) {
      Get.snackbar("Error".tr, "Network Error".tr);
      return;
    }

    Map<String, dynamic> data = response.body['data']['user'];
    user.value = User.fromJson(data);
    await storage.saveData("user", jsonEncode(data));
  }

  Future<void> logout() async {
    Get.put(SecureStorageRepositoryImpl());
    final SecureStorageRepositoryImpl storage = Get.find();
    await storage.deleteData("user");
    await storage.deleteData("token");

    Get.snackbar("Success".tr, "logout successful".tr);
  }
}
