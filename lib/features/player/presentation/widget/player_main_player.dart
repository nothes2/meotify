import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meowdify/core/widgets/general.dart';
import 'package:meowdify/features/player/presentation/controller/controller_music_player.dart';
class MainPlayer extends StatelessWidget {
  final AudioController controller;
  const MainPlayer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return const MeoCard(
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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/images/icon/btn_pre.svg",
          height: 24,
        ),
        const SizedBox(width: 8),
        SvgPicture.asset(
          "assets/images/icon/btn_play.svg",
          height: 48,
        ),
        const SizedBox(width: 8),
        SvgPicture.asset(
          "assets/images/icon/btn_next.svg",
          height: 24,
        ),
      ],
    ));
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("00:00"),
        const SizedBox(width: 8),
        SizedBox(
          width: 550,
          child: LinearProgressIndicator(
            value: 0.6,
            backgroundColor: Theme.of(context).colorScheme.surface,
            valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary),
          ),
        ),
        const SizedBox(width: 8),
        const Text("10:00")
      ],
    );
  }
}
