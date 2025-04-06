import 'package:flutter/material.dart';
import 'package:meowdify/core/utilities/general.dart';
import 'package:meowdify/core/widgets/general.dart';

class MetaInfo extends StatelessWidget {
  const MetaInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MeoCard(
      padding: 10,
      radius: 5,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              MeoShimmer(hight: 50, width: 50),
              SizedBox(
                width: 8,
              ),
              Expanded(child: MetaText())
              // Image.asset(
              //   "",
              //   height: 48,
              // ),
            ],
          ),
        ],
      ),
    );
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
          const Text(
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
        const Text(
          "info",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
