import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/domain/entities/en_user.dart';
import 'package:meowdify/core/utilities/flutter_secure_storage_repo_impl.dart';
import 'package:meowdify/core/utilities/general.dart';
import 'package:meowdify/features/music_home/data/repository/repo_playlist.dart';
import 'package:meowdify/features/music_home/domain/entities/playlist.dart';
import 'package:meowdify/features/user/presentation/controller/controller_debounce.dart';

class LibController extends GetxController {
  final lib = Rx<List<Library>>([]);

  final fileUploadSuccess = false.obs;
  final tempId = "".obs;

  final selectedPlaylistType = "playlist".obs;
  final selectedVisibility = "public".obs;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final _debounceController = Get.put(DebounceController());
  final storage = Get.put(SecureStorageRepositoryImpl());

  final title = "".obs;
  final description = "".obs;

  final titleError = "".obs;
  final descriptionError = "".obs;

  @override
  void onInit() {
    super.onInit();
    getLib(); // Ensure this is only called once during initialization
  }

  void onValueChanged(String value, String fieldName) {
    _debounceController.debounceInput(value, (input) {
      if (fieldName == 'title') {
        validateTitle(input);
      } else if (fieldName == 'description') {
        validateDescription(input);
      }
    });
  }

  void validateTitle(String value) {
    title.value = value;
    titleError.value = title.value.isEmpty ? "Title cannot be empty" : "";
  }

  void validateDescription(String value) {
    description.value = value;
    descriptionError.value =
        description.value.isEmpty ? "Description cannot be empty" : "";
  }

  final libRepo = Get.put(PlaylistRepo());

  Future<void> uploadCover() async {
    final file = await pickSingleFile(FileType.image);

    if (file == null) {
      return;
    }

    final response = await libRepo.uploadAlbumCover(File(file.path!));

    final data = response.body['data']["tempId"];
    print(data);
    tempId.value = data;
  }

  Future<void> addPlaylist() async {
    final userData = await storage.getData("user");

    final user = User.fromJson(jsonDecode(userData));
    if (user.id == null) {
      Get.snackbar("error", "can't find user currently");
      return;
    }

    Playlist playlist = Playlist(
        name: title.value,
        image: tempId.value,
        canBeRemoved: true,
        type: selectedPlaylistType.value,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        userId: user.id ?? "",
        songs: [],
        subfolders: []);

// TODO handle data here
    final response = await libRepo.addAlbum(playlist);

    if (response.statusCode != 200) {
      Get.snackbar("error", "add playlist failed!");
      return;
    }
    getLib();
    Get.snackbar("info", "add album success!");
    tempId.value = "";
  }

// Get Music Library from backend
  Future<void> getLib() async {
    final userData = User.fromJson(jsonDecode(await storage.getData("user")));
    var response = await libRepo.getLib(userData.id.toString());
    if (response.statusCode != 200) {
      Get.snackbar("error", "connection failed!");
      return;
    }

    List<dynamic> data = response.body['data'];

    if (data.isEmpty) {
      Get.snackbar("error", "no playlist found!");
      return;
    }

    print(data);
    var playlistData = data[0];

    lib.value = (playlistData as List<dynamic>)
        .map((element) => Library.fromJson(element as Map<String, dynamic>))
        .toList();

    return;
  }
}
