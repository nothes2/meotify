import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:meowdify/core/domain/entities/en_user.dart';
import 'package:meowdify/core/utilities/flutter_secure_storage_repo_impl.dart';

class MusicUploadRepoImpl {
  final String baseUrl = 'http://127.0.0.1:3000';
  final storage = Get.put(SecureStorageRepositoryImpl());

  Future<http.Response?> uploadMusic(File file) async {
    final userData = await storage.getData("user");
    final user = User.fromJson(jsonDecode(userData));

    try {
      final uri = Uri.parse("$baseUrl/upload");
      final request = http.MultipartRequest('POST', uri);

      request.fields['_id'] = user.id ?? "";
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        file.path,
        filename: file.uri.pathSegments.last,
      ));

      final streamedResponse =
          await request.send().timeout(const Duration(minutes: 5));
      final response = await http.Response.fromStream(streamedResponse);

      return response;
    } on TimeoutException catch (e) {
      print(e);
      return http.Response(
          jsonEncode({'message': 'File upload timed out'}), 408);
    } catch (e) {
      debugPrint("$e");
      return http.Response(
          jsonEncode({'message': 'Unexpected upload error'}), 500);
    }
  }

  Future<http.Response?> findUserById(String? id) async {
    try {
      final uri = Uri.parse("$baseUrl/find_user_by_id");
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'id': id}),
      );

      return response;
    } catch (e) {
      debugPrint("Error: $e");
      return null;
    }
  }

  Future<http.Response?> uploadMusicCover(File file) async {
    try {
      final uri = Uri.parse("$baseUrl/upload_album_cover");
      final request = http.MultipartRequest('POST', uri);

      request.files.add(await http.MultipartFile.fromPath(
        'file',
        file.path,
        filename: file.uri.pathSegments.last,
      ));

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return response;
    } catch (e) {
      debugPrint("$e");
      return null;
    }
  }

  Future<http.Response?> publish(String tempPath, String title, String genre,
      String? id, String url, String uploaderId) async {
    final uri = Uri.parse("$baseUrl/publish_music");
    print("$tempPath, ${title.toString()}, $genre, $id, $url, $uploaderId");
    return await http.post(uri, body: {
      "album_cover": tempPath,
      "title": title.toString(),
      "genre": genre.toString(),
      "url": url.toString(),
      "id": id.toString(),
      "uploader_id": uploaderId
    });
  }
}
