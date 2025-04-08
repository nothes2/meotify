import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:meowdify/features/music_creator/data/repository/impl/repo_upload_impl.dart';

class UploadController extends GetxController {
  var isUploading = false.obs;
  var success = false.obs;
  final musicUploadRepo = MusicUploadRepoImpl();

  Future<void> pickAndUploadFile() async {
    success.value = false;
    isUploading.value = true;
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['mp3', 'wav', 'flac']);

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      File pickedFile = File(file.path!);
      var flag = await musicUploadRepo.uploadMusic(pickedFile);

      if (!flag) {
        Get.snackbar("error", "music upload filed!");
      }
      isUploading.value = false;
      success.value = true;
      return;
    }
    isUploading.value = false;
    Get.snackbar("info", "no file selected.");
  }
}
