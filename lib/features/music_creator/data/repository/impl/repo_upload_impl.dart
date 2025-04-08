import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:meowdify/core/domain/entities/en_user.dart';
import 'package:meowdify/core/utilities/flutter_secure_storage_repo_impl.dart';
import 'package:meowdify/features/music_creator/data/repository/upload_repository.dart';

class MusicUploadRepoImpl extends GetConnect implements MusicUpload {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://127.0.0.1:3000';
    Get.put(SecureStorageRepositoryImpl());
    httpClient.timeout = const Duration(seconds: 10);
    super.onInit();
  }

  @override
  Future<bool> uploadMusic(File file) async {
    final storage = Get.find<SecureStorageRepositoryImpl>();
    final userData = await storage.getData("user");
    final user = User.fromJson(jsonDecode(userData));
    try {
      final fileBytes = await file.readAsBytes();
      final formData = FormData({
        "_id": user.id,
        'file': MultipartFile(fileBytes, filename: file.uri.pathSegments.last),
      });

      final response = await post('http://127.0.0.1:3000/upload', formData);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
