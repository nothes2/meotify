import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/constants/general.dart';
import 'package:meowdify/core/utilities/general.dart';
import 'package:meowdify/core/widgets/general.dart';
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
              ? Image.network(Uri.encodeFull(
                  "${header}${controller.lib.value[index].playlist!.image}"))
              : SvgPicture.asset(
                  "assets/images/icon/ic_loved.svg",
                  height: 48,
                  width: 48,
                ),
          title:
              Text(controller.lib.value[index].playlist?.name ?? "not found"),
          subtitle:
              Text(controller.lib.value[index].playlist?.type ?? "no type"),
          onTap: () {},
        ),
        onSecondaryTapDown: (TapDownDetails details) {
          _showMenu(context, details.globalPosition, controller, index);
        },
      );
    },
  );
}

void _showMenu(BuildContext context, Offset position, LibController controller,
    int index) {
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
      PopupMenuItem(
        value: 'edit',
        child: const Text('Edit'),
      ),
      PopupMenuItem(
        value: 'delete',
        child: const Text('Delete'),
      ),
    ],
  ).then((value) {
    if (value == 'edit') {
      debugPrint(
          'Edit selected for index $index ${controller.lib.value[index].playlist?.name}');
    } else if (value == 'delete') {
      debugPrint('Delete selected for index $index');
    }
  });
}

Widget _dialog(LibController controller) {
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
                    return controller.tempId.value == ""
                        ? const MeoShimmer(
                            hight: 100,
                            width: 100,
                          )
                        : Image.network(
                            tempHeader + controller.tempId.value,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          );
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
              onValueChanged: (description, _) {
                debugPrint(description);
              },
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
                  value: "folder",
                  child: Text("Folder"),
                ),
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
          controller.addPlaylist();
          Get.back();
        },
        child: const Text("Create"),
      ),
    ],
  );
}
