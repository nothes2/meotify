import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/utilities/general.dart';

class MusicManagement extends StatelessWidget {
  const MusicManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyTrackList();
  }
}

// TODO manage ur own  tack list with album
class MyTrackList extends StatelessWidget {
  const MyTrackList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleText("Music Management".tr),
            Row(
              children: [
                TextButton(onPressed: () {}, child: const Text("data")),
                TextButton(onPressed: () {}, child: const Text("data")),
                TextButton(onPressed: () {}, child: const Text("data")),
              ],
            )
          ],
        ),
        Row(
          children: [
            Expanded(
                child: DataTable(
              columns: [
                DataColumn(
                  label: Checkbox(value: false, onChanged: (change) {}),
                ),
                const DataColumn(label: Text('Name')),
                const DataColumn(label: Text('Age')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Checkbox(value: false, onChanged: (change) {})),
                  const DataCell(Text('Alice')),
                  const DataCell(Text('24')),
                ]),
                DataRow(cells: [
                  DataCell(Checkbox(value: false, onChanged: (change) {})),
                  const DataCell(Text('Bob')),
                  const DataCell(Text('30')),
                ]),
              ],
            ))
          ],
        )
      ],
    );
  }
}
