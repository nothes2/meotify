import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/domain/entities/en_track.dart';
import 'package:meowdify/core/domain/entities/en_user.dart';
import 'package:meowdify/core/utilities/flutter_secure_storage_repo_impl.dart';
import 'package:meowdify/features/music_creator/data/repository/repo_music_management.dart';

class MusicManagementController extends GetxController {
  final songs = TrackInfo().obs;
  final musicManagementRepo = Get.put(MusicManagementRepo());
  final storage = Get.put(SecureStorageRepositoryImpl());
  final musicList = Rx<List<TrackInfo>>([]);
  final isHovering = false.obs;
  @override
  void onInit() {
    getUserMusic();
    super.onInit();
  }

  void onHoverEnter() => isHovering.value = true;
  void onHoverExit() => isHovering.value = false;

  Future<void> getUserMusic() async {
    final userData = await storage.getData("user");
    final user = User.fromJson(jsonDecode(userData));

    if (user.id == null) {
      Get.snackbar("Error".tr, "Network error".tr);
      return;
    }
    Response response = await musicManagementRepo.getUserMusic(user.id ?? "");

    List<dynamic> data = response.body['data'];

    if (data.isEmpty) {
      debugPrint("no playlist found!");
      return;
    }

    var musicListData = data[0];

    print(musicListData[0]);

    musicList.value = (musicListData as List<dynamic>)
        .map((element) => TrackInfo.fromJson(element as Map<String, dynamic>))
        .toList();
    print(musicList.value[0].toJson());
    return;
  }
}
