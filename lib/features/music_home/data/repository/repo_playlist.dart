import 'dart:io';

import 'package:get/get.dart';
import 'package:meowdify/features/music_home/domain/entities/playlist.dart';

class PlaylistRepo extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "http://127.0.0.1:3000";
    httpClient.timeout = const Duration(seconds: 10);
    super.onInit();
  }

  Future<Response> getLib(String id) async {
    final response = await post("/playlist", {"_id": id});

    return errorCheck("playlist", response);
  }

  Future<Response> uploadAlbumCover(File file) async {
    final fileBytes = await file.readAsBytes();
    final formData = FormData({
      'file': MultipartFile(fileBytes, filename: file.uri.pathSegments.last),
    });

    final response = await post("/upload_album_cover", formData);

    return errorCheck("album cover upload", response);
  }

  Future<Response> addAlbum(Playlist playlist) async {
    print(playlist.userId);
    final response = await post("/add_album", {"playlist": playlist});

    return errorCheck("add_album", response);
  }
}

Response errorCheck(String label, Response response) {
  if (response.isOk) {
    return response;
  } else {
    throw Exception('Failed to $label: ${response.statusText}');
  }
}
