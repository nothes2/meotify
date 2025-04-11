import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:meowdify/core/domain/entities/en_track.dart';
import 'package:meowdify/core/utilities/general.dart';
import 'package:meowdify/features/music_creator/data/repository/repo_upload_impl.dart';
import 'package:meowdify/features/user/presentation/controller/controller_debounce.dart';

// TODO finish the upload feature
class UploadController extends GetxController {
  var isUploading = false.obs;
  var success = false.obs;
  var tempPath = "".obs;

  var trackInfo = Rxn<TrackInfo>();
  final musicUploadRepo = MusicUploadRepoImpl();
  final DebounceController debounceController = Get.put(DebounceController());
  final titleController = TextEditingController();
  final artistController = TextEditingController();
  final genreController = TextEditingController();
  final uploaderController = TextEditingController();

  final titleErrorText = RxnString();
  final artistErrorText = RxnString();
  final genreErrorText = RxnString();
  final uploaderErrorText = RxnString();
  final uploaderId = "".obs;

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
    if (value.isEmpty) {
      titleErrorText.value = "Title cannot be empty";
      return titleErrorText.value;
    }
    titleErrorText.value = null;
    trackInfo.value = (trackInfo.value ?? TrackInfo()).copyWith(title: value);
    return null;
  }

  String? validateArtist(String value) {
    if (value.isEmpty) {
      artistErrorText.value = "Artist cannot be empty";
      return artistErrorText.value;
    }
    artistErrorText.value = null;
    trackInfo.value = (trackInfo.value ?? TrackInfo()).copyWith(artist: value);
    return null;
  }

  String? validateGenre(String value) {
    if (value.isEmpty) {
      genreErrorText.value = "Genre cannot be empty";
      return genreErrorText.value;
    }
    genreErrorText.value = null;
    trackInfo.value = (trackInfo.value ?? TrackInfo()).copyWith(genre: value);
    return null;
  }

  String? validateUploader(String value) {
    if (value.isEmpty) {
      uploaderErrorText.value = "Uploader cannot be empty";
      return uploaderErrorText.value;
    }
    uploaderErrorText.value = null;
    trackInfo.value =
        (trackInfo.value ?? TrackInfo()).copyWith(uploaderId: value);
    return null;
  }

  Future<void> pickAndUploadFile() async {
    success.value = false;
    isUploading.value = true;
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['mp3', 'wav', 'flac']);

    if (result == null && result?.files == null || result!.files.isEmpty) {
      isUploading.value = false;
      Get.snackbar("info", "no file selected.");
      return;
    }

    final file = result.files.first;
    File pickedFile = File(file.path!);
    var response = await musicUploadRepo.uploadMusic(pickedFile);

    if (response == null) {
      Get.snackbar("error", "music upload filed!");
      isUploading.value = false;
      success.value = false;
      return;
    }

    if (response.statusCode == 408) {
      Get.snackbar("error", "file upload timeout!");
      success.value = false;
      isUploading.value = false;
      return;
    }

    final responseBody = jsonDecode(response.body);
    final data = responseBody['data'];

    if (data is List && data.length >= 2 && data[1] != null) {
      tempPath.value = "temp/${data[1]}";
    }

    final body =
        (data is List && data.isNotEmpty && data[0] is Map<String, dynamic>)
            ? data[0] as Map<String, dynamic>
            : <String, dynamic>{};

    if (body.isEmpty) {
      Get.snackbar("error", "cant find data");
      success.value = false;
      isUploading.value = false;
      return;
    }

    final track = TrackInfo.fromJson(body);
    print("track id in music_upload_controller.dart:140: ${track.id}");
    final artist = track.artist;
    uploaderId.value = track.uploaderId ?? "";
    final uploader = await findUserById(track.uploaderId);
    titleController.text = track.title ?? '';
    artistController.text = artist ?? '';
    genreController.text = track.genre ?? '';
    uploaderController.text = uploader ?? '';
    trackInfo.value = track;

    isUploading.value = false;
    success.value = true;
    return;
  }

  Future<void> uploadCover() async {
    final file = await pickSingleFile(FileType.image);

    if (file == null) {
      return;
    }

    final response = await musicUploadRepo.uploadMusicCover(File(file.path!));

    print(response!.body);
    final Map<String, dynamic> body = jsonDecode(response!.body);
    if (body['success'] == true) {
      final data = body['data']?['tempId'];
      if (data != null) {
        tempPath.value = "temp/$data";
      }
    } else {
      Get.snackbar("Error", body['message'] ?? "Failed to upload cover.");
    }
  }

  Future<String?> findUserById(String? id) async {
    final response = await musicUploadRepo.findUserById(id);

    final Map<String, dynamic> body = jsonDecode(response!.body);

    if (body["success"] == true &&
        body["data"] is List &&
        body["data"].isNotEmpty) {
      return body["data"][0];
    }
    return null;
  }

  Future<void> publish() async {
    if (tempPath.value.isEmpty ||
        titleController.text.isEmpty ||
        genreController.text.isEmpty ||
        uploaderController.text.isEmpty) {
      Get.snackbar("error", "you have to fill all blanks!");
      return;
    }

    if (trackInfo.value == null ||
        uploaderId.isEmpty ||
        trackInfo.value?.url == null) {
      Get.snackbar("error", "internal server error");
      return;
    }

    print(trackInfo.value!.id);

    http.Response? response = await musicUploadRepo.publish(
        tempPath.value,
        titleController.text,
        genreController.text,
        trackInfo.value?.id,
        trackInfo.value!.url ?? "",
        uploaderId.value);

    final Map<String, dynamic> body = jsonDecode(response!.body);

    if (body["success"] == true) {
      Get.snackbar("success!", "you published a track!");
      return;
    }

    Get.snackbar("error", "upload failed! Internal Server error");
  }
}
