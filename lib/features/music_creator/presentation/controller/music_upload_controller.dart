import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meowdify/features/music_creator/data/repository/impl/repo_upload_impl.dart';
import 'package:meowdify/features/user/presentation/controller/controller_debounce.dart';

// TODO finish the upload feature
class UploadController extends GetxController {
  var isUploading = false.obs;
  var success = false.obs;
  var trackinfo = <String, dynamic>{}.obs;
  final musicUploadRepo = MusicUploadRepoImpl();
  final DebounceController debounceController = Get.put(DebounceController());

  final titleController = TextEditingController();
  final artistController = TextEditingController();
  final genreController = TextEditingController();
  final uploaderController = TextEditingController();

  final title = "".obs;
  final artist = "".obs;
  final genre = "".obs;
  final uploader = "".obs;

  final titleErrorText = RxnString();
  final artistErrorText = RxnString();
  final genreErrorText = RxnString();
  final uploaderErrorText = RxnString();

  void onValueChanged(String value, String fieldName) {
    final validationMap = {
      'title': validateTitle,
      'artist': validateArtist,
      'genre': validateGenre,
      'uploader': validateUploader,
    };

    final validate = validationMap[fieldName];
    if (validate != null) {
      debounceController.debounceInput(value, validate);
    }
  }

  String? validateTitle(String value) {
    title.value = value;
  }

  String? validateArtist(String value) {
    artist.value = value;
  }

  String? validateGenre(String value) {
    genre.value = value;
  }

  String? validateUploader(String value) {
    uploader.value = value;
  }

  Future<void> pickAndUploadFile() async {
    success.value = false;
    isUploading.value = true;
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['mp3', 'wav', 'flac']);

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      File pickedFile = File(file.path!);
      var response = await musicUploadRepo.uploadMusic(pickedFile);

      if (response == null) {
        Get.snackbar("error", "music upload filed!");
        isUploading.value = false;
        success.value = false;
        return;
      }

      Map<String, dynamic> track = response.body['data']['track'];

      trackinfo.value = {
        'duration': track['duration']?.toString() ?? 'Unknown',
        'url': track['url']?.toString() ?? '',
        'createdAt': track['createdAt']?.toString() ?? '',
        'updatedAt': track['updatedAt']?.toString() ?? '',
        'uploader_id': track['uploader_id']?.toString() ?? '',
        'title': track['title']?.toString() ?? 'Untitled',
        'artist': track['artist']?.toString() ?? 'Unknown Artist',
        'coverUrl': track['coverUrl']?.toString() ?? '',
        'genre': track['genre']?.toString() ?? 'Unknown Genre',
      };

      uploader.value = track['uploader_id'] ?? '';
      title.value = track['title'] ?? 'Untitled';
      artist.value = track['artist'] ?? 'Unknown Artist';
      genre.value = track['genre'] ?? 'Unknown Genre';

      isUploading.value = false;
      success.value = true;
      return;
    }
    isUploading.value = false;
    Get.snackbar("info", "no file selected.");
  }
}
