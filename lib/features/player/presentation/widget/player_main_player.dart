import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/widgets/general.dart';
import 'package:meowdify/features/player/presentation/controller/controller_music_player.dart';

class MainPlayer extends StatelessWidget {
  final AudioController controller;
  const MainPlayer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MeoCard(
      padding: 10,
      radius: 5,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainButtonGroup(
            controller: controller,
          ),
          ProgressBar(controller: controller)
        ],
      ),
    );
  }
}

class MainButtonGroup extends StatelessWidget {
  const MainButtonGroup({super.key, required this.controller});
  final AudioController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/images/icon/btn_pre.svg",
          height: 20,
        ),
        const SizedBox(width: 8),
        Obx(() {
          return GestureDetector(
            child: SvgPicture.asset(
              controller.isPlaying.value
                  ? "assets/images/icon/btn_pause.svg"
                  : "assets/images/icon/btn_play.svg",
              height: 36,
            ),
            onTapDown: (detail) => {controller.togglePlayPause()},
          );
        }),
        const SizedBox(width: 8),
        SvgPicture.asset(
          "assets/images/icon/btn_next.svg",
          height: 20,
        ),
      ],
    );
  }
}

class ProgressBar extends StatelessWidget {
  final AudioController controller;
  const ProgressBar({super.key, required this.controller});
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final position = controller.currentPosition.value;
      final total = controller.totalDuration.value;

      final double current = position.inSeconds.toDouble();
      final double max = total.inSeconds.toDouble();

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(formatDuration(position)),
          const SizedBox(width: 8),
          SizedBox(
              width: 550,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 3,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 6),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 12),
                ),
                child: Slider(
                  min: 0.0,
                  max: max == 0.0 ? 100.0 : max, // prevent div by zero
                  value: current,
                  onChanged: (value) {
                    controller.startDragging(value);
                    controller.updateDragging(value);
                  },
                  onChangeEnd: (value) {
                    controller.endDragging(value);
                  },
                ),
              )),
          const SizedBox(width: 8),
          Text(formatDuration(total)),
        ],
      );
    });
  }
}
