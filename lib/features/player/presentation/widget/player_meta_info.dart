import 'package:flutter/material.dart';
import 'package:meowdify/core/widgets/effect.dart';
import 'package:meowdify/core/widgets/general.dart';

class MetaInfo extends StatelessWidget {
  const MetaInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MeoCard(
      padding: 10,
      radius: 5,
      child: Row(
        children: [
          Image.asset(
            "",
            height: 48,
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
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Title"),
          OutlinedButton.icon(onPressed: () {}, label: const Icon(Icons.abc))
        ]),
        Text("info"),
        // TODO audio visualizer
        const Placeholder()
      ],
    );
  }
}
