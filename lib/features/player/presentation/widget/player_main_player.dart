import 'package:flutter/material.dart';
import 'package:meowdify/core/widgets/general.dart';

class MainPlayer extends StatelessWidget {
  const MainPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MeoCard(
      padding: 10,
      radius: 5,
      child: Column(
        children: [MainButtonGroup(), ProgressBar()],
      ),
    );
  }
}

class MainButtonGroup extends StatelessWidget {
  const MainButtonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.abc,
          size: 12,
        ),
        Icon(
          Icons.abc,
          size: 24,
        ),
        Icon(
          Icons.abc,
          size: 12,
        )
      ],
    ));
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("0"),
          const SizedBox(
            height: 50,
            child: Placeholder(),
          ),
          Text("1")
        ],
      ),
    );
  }
}
