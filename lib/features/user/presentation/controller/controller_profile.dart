import 'dart:convert';

import 'package:get/get.dart';
import 'package:meowdify/core/domain/entities/en_track.dart';
import 'package:meowdify/core/domain/entities/en_user.dart';
import 'package:meowdify/core/utilities/flutter_secure_storage_repo_impl.dart';
import 'package:meowdify/features/user/data/repositories/impl/profile_repository.dart';
import 'package:meowdify/features/user/domain/entities/history.dart';
import 'package:meowdify/features/user/domain/entities/profile_interaction.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    getInfo();
    super.onInit();
  }

  final user = User().obs;
  final history = History().obs;
  final stats = "".obs;
  final profileInteractionData = ProfileInteraction().obs;
  final profileRepo = Get.put(ProfileRepository());

  Future<void> getInfo() async {
    if (user.value.id == null) {
      final storage = Get.put(SecureStorageRepositoryImpl());

      user.value = User.fromJson(jsonDecode(await storage.getData("user")));
      print(user.value.toJson());
      // interaction table
      // song table
      // album table
      if (user.value.id == null) {
        Get.snackbar("error", "cannot find user data!");
        return;
      }
      final response = await profileRepo.getUserInteractionInfo(user.value.id!);

      profileInteractionData.value = getProfileInteraction(response);

      return;
    }
  }
}

List<History> getHistory(Response response) {
  throw Exception("have to implement.");
}

ProfileInteraction getProfileInteraction(Response response) {
  final data = response.body["data"][0];

  if (data.isEmpty) {
    Get.snackbar("error", "network error");
    throw Exception("data not found");
  }

  return ProfileInteraction.fromJson(data);
}

List<TrackInfo> getTracks(Response response) {
  List<TrackInfo> data = response.body["data"][0];

  if (data.isEmpty) {
    Get.snackbar("Error".tr, "Network error".tr);
    throw Exception("data not found");
  }

  return (data as List<dynamic>).map((e) => TrackInfo.fromJson(e)).toList();
}
