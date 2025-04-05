import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meowdify/core/widgets/general.dart';

class PlaylistBtnGroup extends StatelessWidget {
  const PlaylistBtnGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return const MeoCard(
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset(
          'assets/images/icon/btn_queue.svg',
          height: 28,
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(
          'assets/images/icon/btn_loop.svg',
          height: 28,
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/images/icon/btn_volume.svg',
                height: 28,
              ),
              Expanded(
                child: Slider(value: .2, onChanged: (double value) {}),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class QueueInfo extends StatelessWidget {
  const QueueInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Current playing songname asdadsdsaasd",
      maxLines: 1,
    );
  }
}
