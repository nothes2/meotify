import 'dart:io';

import 'package:get/get.dart';
import 'package:meowdify/core/utilities/general.dart';

class AccountRepository extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "http://127.0.0.1:3000";
    super.onInit();
  }

/*************  ✨ Windsurf Command ⭐  *************/
  /// Upload a profile picture for a user
  ///
  /// [file] is the image file to upload
  /// [id] is the id of the user
  ///
  /// returns a Response object containing the result of the upload
/*******  1b2a54e7-79e4-47b8-9a71-ba0e004285b9  *******/ Future<Response>
      uploadPfp(File file, String id) async {
    final fileBytes = file.readAsBytesSync();

    final formData = FormData({
      '_id': id,
      'file': MultipartFile(fileBytes, filename: file.uri.pathSegments.last)
    });

    return errorCheck("upload pfp", await post("/upload_pfp", formData));
  }

  Future<Response> getUser(String id) async {
    final response = await post("/find_user_by_id", {"id": id});

    return errorCheck("get user", response);
  }
}
