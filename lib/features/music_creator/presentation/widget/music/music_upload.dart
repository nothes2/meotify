import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/features/music_creator/presentation/controller/music_upload_controller.dart';

class MusicUpload extends StatelessWidget {
  const MusicUpload({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadController());

    return Obx(() {
      if (controller.isUploading.value) {
        return const CircularProgressIndicator();
      }

      return Column(
        children: [
          _buildHeader(controller),
          // TODO when controller.success is true, show the meta_data edit panel
        ],
      );
    });
  }

  Widget _buildHeader(UploadController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Upload Music",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        ElevatedButton(
          onPressed: () async {
            controller.pickAndUploadFile();
          },
          child: const Text('Upload Track'),
        ),
      ],
    );
  }
}
