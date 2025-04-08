import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/utilities/general.dart';
import 'package:meowdify/features/music_creator/presentation/controller/music_upload_controller.dart';

// TODO fileupload
class MusicManagement extends StatelessWidget {
  const MusicManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadController());
    return Obx(() {
      return Center(
          child: controller.isUploading.value
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    controller.pickAndUploadFile();
                  },
                  child: const Text('Upload Audio'),
                ));
    });
  }
}
