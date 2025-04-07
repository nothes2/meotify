import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/features/music_creator/presentation/controller/music_upload_controller.dart';

// TODO fileupload
class MusciUpload extends StatelessWidget {
  const MusciUpload({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadController());
    return Obx(() {
      return Center(
          child: controller.isUploading.value
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    // Replace with the actual audio file path from your app
                    String inputPath =
                        'path_to_your_audio_file.wav'; // This could be a local file or fetched from your assets.
                    await controller.convertAndUploadAudio(inputPath);
                  },
                  child: Text('Upload Audio'),
                ));
    });
  }
}
