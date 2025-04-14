import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/constants/general.dart';
import 'package:meowdify/core/utilities/general.dart';
import 'package:meowdify/features/music_creator/presentation/controller/music_management_controller.dart';

class MusicManagement extends StatelessWidget {
  const MusicManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyTrackList();
  }
}

// TODO manage ur own  tack list with album, fix this later, current progresss: show the data
class MyTrackList extends StatelessWidget {
  const MyTrackList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MusicManagementController());
    return Obx(() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleText("Music Management".tr),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Text("delete")),
                ],
              )
            ],
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: _dataTable(controller, context),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

Widget _dataTable(MusicManagementController controller, BuildContext context) {
  return DataTable(
      dividerThickness: 0.0, // Remove horizontal row dividers
      horizontalMargin: 0.0,
      columnSpacing: 16,
      headingRowColor:
          WidgetStateProperty.all(Theme.of(context).colorScheme.surface),
      showBottomBorder: false,
      showCheckboxColumn: true,
      border: const TableBorder(
          horizontalInside: BorderSide.none, verticalInside: BorderSide.none),
      columns: [
        DataColumn(label: Checkbox(value: false, onChanged: (onChanged) {})),
        const DataColumn(label: Text("Cover")),
        const DataColumn(label: Text("Title")),
        const DataColumn(label: Text("Duration")),
        const DataColumn(label: Text("Listen count")),
        const DataColumn(label: Text("Action")),
      ],
      rows: controller.musicList.value
          .map((track) => DataRow(cells: [
                DataCell(Checkbox(
                  value: false,
                  onChanged: (value) {},
                )),
                DataCell(Image.network(
                  "$header/music/${track.coverUrl}",
                  height: 48,
                  width: 48,
                  fit: BoxFit.cover,
                )),
                DataCell(
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        track.title ?? "",
                      ),
                      Text(track.artist ?? "",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 12)),
                    ],
                  ),
                ),
                DataCell(Text(formatDuration(track.duration ?? 0.0))),
                const DataCell(
                  Text("playcount"),
                ),
                DataCell(
                  TextButton(onPressed: () {}, child: const Text("Edit")),
                )
              ]))
          .toList());
}
