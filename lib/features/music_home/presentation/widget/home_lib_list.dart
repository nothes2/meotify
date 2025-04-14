import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/constants/general.dart';
import 'package:meowdify/core/routes/routes.dart';
import 'package:meowdify/core/utilities/general.dart';
import 'package:meowdify/core/utilities/navigator_key.dart';
import 'package:meowdify/core/widgets/general.dart';
import 'package:meowdify/features/music_home/domain/entities/playlist.dart';
import 'package:meowdify/features/music_home/presentation/controller/controller_lib.dart';
import 'package:meowdify/features/user/presentation/components/single_input.dart';

class MusicLib extends StatelessWidget {
  const MusicLib({super.key});

// TODO GET PLAYLIST FROM BACKEND
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LibController());
    return MeoCard(
        padding: 0,
        radius: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Your library", style: TextStyle(fontSize: 16)),
                  TextButton.icon(
                      onPressed: () {
                        Get.dialog(_dialog(controller));
                      },
                      label: const Text("ADD"),
                      icon: const Icon(Icons.add)),
                ],
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: Obx(() {
                    return _listBuilder(controller);
                  })),
            )
          ],
        ));
  }
}

// TODO Update album info and click to the album page
Widget _listBuilder(LibController controller) {
  return ListView.builder(
    itemCount: controller.lib.value.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        child: ListTile(
          leading: controller.lib.value[index].playlist?.image != null &&
                  controller.lib.value[index].playlist!.image!.isNotEmpty
              ? Image.network(
                  Uri.encodeFull(
                      "$header${controller.lib.value[index].playlist!.image}"),
                  height: 48,
                  width: 48,
                  fit: BoxFit.cover,
                )
              : SvgPicture.asset(
                  "assets/images/icon/ic_loved.svg",
                  height: 48,
                  width: 48,
                ),
          title:
              Text(controller.lib.value[index].playlist?.name ?? "not found"),
          subtitle:
              Text(controller.lib.value[index].playlist?.type ?? "no type"),
          onTap: () {
            print(controller.lib.value[index].playlist?.toJson());
            home.currentState?.pushReplacementNamed(
                "${AppRoutes.playlist}${controller.lib.value[index].playlist?.id}");
          },
        ),
        onSecondaryTapDown: (TapDownDetails details) {
          _showMenu(context, details.globalPosition, controller,
              controller.lib.value[index].playlist);
        },
      );
    },
  );
}

void _showMenu(BuildContext context, Offset position, LibController controller,
    Playlist? playlist) {
  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  final offset = overlay.globalToLocal(position);
  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(
      offset.dx,
      offset.dy,
      offset.dx,
      offset.dy,
    ),
    items: [
      const PopupMenuItem(
        value: 'edit',
        child: Text('Edit'),
      ),
      const PopupMenuItem(
        value: 'delete',
        child: Text('Delete'),
      ),
    ],
  ).then((value) {
    if (value == 'edit') {
      print(playlist?.id);
      // TODO edit logical here
      Get.dialog(_dialog(controller, isUpdate: true, playlist: playlist));
    } else if (value == 'delete') {
      debugPrint('Delete selected for index ${playlist?.id}');
      if (playlist?.id == null) {
        Get.snackbar("Error".tr, "Network error".tr);
        return;
      }

      controller.deleteLib(playlist?.id ?? "");
    }
  });
}

Widget _dialog(LibController controller, {bool? isUpdate, Playlist? playlist}) {
  if (isUpdate != null) {
    controller.titleController.text = playlist?.name ?? "";
    controller.descriptionController.text = playlist?.description ?? "";
    controller.selectedVisibility.value = playlist?.visibility ?? "public";
    controller.selectedPlaylistType.value = playlist?.type ?? "public";
  }

  return AlertDialog(
    title: const Text("Add Playlist"),
    content: SingleChildScrollView(
      child: SizedBox(
        width: 400, // Set a wider width for the dialog
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Obx(() {
                    final hasTempImage = controller.tempId.value.isNotEmpty;
                    final isUpdating = isUpdate != null;

                    if (hasTempImage) {
                      return Image.network(
                        tempHeader + controller.tempId.value,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      );
                    } else if (isUpdating && playlist != null) {
                      return Image.network(
                        "$header${playlist.image}",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      );
                    } else {
                      return const MeoShimmer(
                        hight: 100,
                        width: 100,
                      );
                    }
                  }),
                  onTap: () => {controller.uploadCover()},
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SingleInput(
                        label: "Title",
                        keyboardType: TextInputType.text,
                        prefixIcon: Icons.abc,
                        onValueChanged: controller.onValueChanged,
                        fieldName: 'title',
                        controller: controller.titleController,
                        errorText: "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: "Select Visibility",
                          prefixIcon: Icon(Icons.playlist_play),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: "public",
                            child: Text("Public"),
                          ),
                          DropdownMenuItem(
                            value: "private",
                            child: Text("Private"),
                          ),
                        ],
                        onChanged: (value) {
                          debugPrint("Selected playlist type: $value");
                          controller.selectedVisibility.value = value ?? "";
                        },
                        value: controller.selectedVisibility.value.isEmpty
                            ? null
                            : controller.selectedVisibility.value,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SingleInput(
              label: "Description",
              keyboardType: TextInputType.text,
              prefixIcon: Icons.description,
              onValueChanged: controller.onValueChanged,
              fieldName: 'description',
              controller: controller.descriptionController,
              errorText: "",
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Select Playlist Type",
                prefixIcon: Icon(Icons.playlist_play),
              ),
              items: const [
                DropdownMenuItem(
                  value: "playlist",
                  child: Text("Playlist"),
                ),
                DropdownMenuItem(
                  value: "album",
                  child: Text("Album"),
                ),
              ],
              onChanged: (value) {
                debugPrint("Selected playlist type: $value");
                controller.selectedPlaylistType.value = value ?? "";
              },
              value: controller.selectedPlaylistType.value.isEmpty
                  ? null
                  : controller.selectedPlaylistType.value,
            ),
          ],
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Get.back(),
        child: const Text("CANCEL"),
      ),
      TextButton(
        onPressed: () {
          if (isUpdate == null) {
            controller.addPlaylist();
            Get.back();
            return;
          }

          controller.updatePlaylist(playlist?.id ?? "", playlist?.userId ?? "");
          Get.back();
        },
        child: Text(isUpdate != null ? "UPDATE" : "CREATE"),
      ),
    ],
  );
}
