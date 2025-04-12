import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/constants/general.dart';
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
          const SizedBox(height: 20),
           controller.publishSuccess.value ?  Center(child: Column(children: [
            Icon(Icons.publish, color: Theme.of(context).colorScheme.primary,),
            const Text("upload success!")],)) : _buildPanel(controller)
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
                      controller.publish();
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
                  Obx(() {
                    return GestureDetector(
                      onTapDown: (details) => {controller.uploadCover()},
                      child: controller.tempPath.value.isEmpty
                          ? const MeoShimmer(
                              hight: 250,
                              width: 250,
                            )
                          : Image.network(
                              "$header/${controller.tempPath.value}",
                              height: 250,
                              width: 250,
                              fit: BoxFit.cover,
                            ),
                    );
                  }),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SingleInput(
                          controller: controller.titleController,
                          keyboardType: TextInputType.text,
                          label: "Title",
                          prefixIcon: Icons.abc,
                          onValueChanged: controller.onValueChanged,
                          fieldName: 'title',
                          errorText: controller.titleErrorText.value ?? "",
                        ),
                        const SizedBox(height: 10),
                        SingleInput(
                          controller: controller.artistController,
                          keyboardType: TextInputType.text,
                          label: 'Artist',
                          prefixIcon: Icons.people,
                          onValueChanged: controller.onValueChanged,
                          fieldName: 'artist',
                          errorText: controller.artistErrorText.value ?? "",
                        ),
                        const SizedBox(height: 10),
                        SingleInput(
                          controller: controller.genreController,
                          keyboardType: TextInputType.text,
                          label: 'Genre',
                          prefixIcon: Icons.stacked_bar_chart,
                          onValueChanged: controller.onValueChanged,
                          fieldName: 'genre',
                          errorText: controller.genreErrorText.value ?? "",
                        ),
                        const SizedBox(height: 10),
                        SingleInput(
                          enabled: false,
                          controller: controller.uploaderController,
                          keyboardType: TextInputType.text,
                          label: 'Uploader',
                          prefixIcon: Icons.verified_user,
                          onValueChanged: controller.onValueChanged,
                          fieldName: 'uploader',
                          errorText: controller.uploaderErrorText.value ?? "",
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
