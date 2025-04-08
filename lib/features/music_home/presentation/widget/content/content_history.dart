// TODO make the history panel
import 'package:flutter/material.dart';
import 'package:meowdify/core/utilities/general.dart';
import 'package:meowdify/core/widgets/general.dart';

class ContentHistory extends StatelessWidget {
  const ContentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextButton(onPressed: () {}, child: const Text("ALL")),
            TextButton(onPressed: () {}, child: const Text("A WEEK AGO")),
          ],
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.start,
          children: List.generate(
            8,
            (index) => const HistoryItem(),
          ),
        )
      ],
    );
  }
}

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    const itemWidth = 180.0;

    return SizedBox(
      width: itemWidth,
      child: MeoCard(
        padding: 0,
        radius: 5,
        color: Theme.of(context).colorScheme.surface,
        child: const Row(
          children: [
            MeoShimmer(
              hight: 40,
              width: 40,
            ),
            SizedBox(width: 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Title",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.ltr,
                    overflow: TextOverflow.fade,
                  ),
                  Text(
                    "Created by author",
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.ltr,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
