import 'package:flutter/material.dart';
import 'package:meowdify/core/widgets/general.dart';

class PlaylistBtnGroup extends StatelessWidget {
  const PlaylistBtnGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return MeoCard(
      padding: 10,
      radius: 5,
      child: Column(
        children: [ListButtonGroup(), QueueInfo()],
      ),
    );
  }
}

class ListButtonGroup extends StatelessWidget {
  const ListButtonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 25, child: Placeholder());
  }
}

class QueueInfo extends StatelessWidget {
  const QueueInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 25,
      child: Placeholder(),
    );
  }
}
