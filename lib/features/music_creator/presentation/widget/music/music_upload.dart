import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/utilities/general.dart';
import 'package:meowdify/features/music_creator/presentation/controller/music_upload_controller.dart';
import 'package:meowdify/features/user/presentation/components/single_input.dart';

class MusicUpload extends StatelessWidget {
  const MusicUpload({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadController());

    return Obx(() {
      if (controller.isUploading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return SingleChildScrollView(
        child: Column(children: [
          _buildHeader(controller),
          // TODO when controller.success is true, show the meta_data edit panel
          const SizedBox(height: 20),
          _buildPanel(controller)
        ]),
      );
    });
  }

// mp3 updating panel

  Widget _buildPanel(UploadController controller) {
    return controller.success.value
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Edit Track Data", style: TextStyle(fontSize: 20)),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle publish logic here
                    },
                    label: const Text("Publish"),
                    icon: const Icon(Icons.upload),
                  )
                ],
              ),
              const SizedBox(height: 10),
              // cover and name with artist
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MeoShimmer(
                    hight: 250,
                    width: 250,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextField(
                          controller: controller.titleController,
                          decoration: const InputDecoration(
                            labelText: "Title",
                            hintText: "Enter track title",
                          ),
                        ),
                        const SizedBox(height: 10),
                        SingleInput(
                          controller: controller.artistController,
                          keyboardType: TextInputType.text,
                          label: 'Aritst',
                          prefixIcon: Icons.people,
                          onValueChanged: controller.onValueChanged,
                          fieldName: 'artist',
                          errorText: "",
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: controller.genreController,
                          decoration: const InputDecoration(
                            labelText: "Genre",
                            hintText: "Enter genre",
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: controller.uploaderController,
                          decoration: const InputDecoration(
                            labelText: "Uploader",
                            hintText: "Enter uploader name",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        : const Center(child: Text("ℹ️ Upload your track first!"));
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
