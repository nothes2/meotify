import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  var isUploading = false.obs;

  Future<void> convertAndUploadAudio(String inputPath) async {
    isUploading.value = true;

    try {
      final FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();
      final result = await _flutterFFmpeg
          .executeWithArguments(['-i', inputPath, '-f', 'mp3', 'pipe:1']);

      // final mp3Data = Uint8List.fromList(result);

      // final uri = Uri.parse('https://yourserver.com/upload');
      // final request = http.MultipartRequest('POST', uri)
      //   ..files.add(http.MultipartFile.fromBytes(
      //     'file',
      //     mp3Data,
      //     filename: 'converted_audio.mp3',
      //     contentType: MediaType('audio', 'mp3'),
      //   ));

      // final response = await request.send();

      // if (response.statusCode == 200) {
      //   Get.snackbar('Success', 'Upload successful!');
      // } else {
      //   Get.snackbar('Error', 'Upload failed!');
      // }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred during the upload: $e');
    } finally {
      isUploading.value = false;
    }
  }
}
