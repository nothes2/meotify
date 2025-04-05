import 'package:flutter/material.dart';
import 'package:meowdify/core/widgets/effect.dart';
import 'package:meowdify/core/widgets/general.dart';
import 'package:shimmer/shimmer.dart';

class MetaInfo extends StatelessWidget {
  const MetaInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MeoCard(
        padding: 10,
        radius: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 56.0,
                    height: 56.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Expanded(child: MetaText())
                // Image.asset(
                //   "",
                //   height: 48,
                // ),
              ],
            ),
          ],
        ));
  }
}

class MetaText extends StatelessWidget {
  const MetaText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Title",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 24,
            width: 24,
            child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {},
                label: const Icon(Icons.add)),
          )
        ]),
        Text(
          "info",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
