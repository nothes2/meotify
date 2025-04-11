import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meowdify/core/widgets/general.dart';
import 'package:meowdify/features/player/presentation/controller/controller_music_player.dart';

class PlaylistBtnGroup extends StatelessWidget {
  final AudioController controller;
  const PlaylistBtnGroup({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MeoCard(
      padding: 10,
      radius: 5,
      child: Column(
        children: [ListButtonGroup(controller: controller), QueueInfo(controller: controller,)],
      ),
    );
  }
}

class ListButtonGroup extends StatelessWidget {
  final AudioController controller;
  const ListButtonGroup({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        // TODO show queue panel
        SvgPicture.asset(
          'assets/images/icon/btn_queue.svg',
          height: 28,
        ),
        const SizedBox(width: 4),
        
        // TODO 3 status type,
        SvgPicture.asset(
          'assets/images/icon/btn_loop.svg',
          height: 28,
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              // switch to mute and normal
              SvgPicture.asset(
                'assets/images/icon/btn_volume.svg',
                height: 28,
              ),

              // TODO make slider work 
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
  final AudioController controller;
  const QueueInfo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Current playing songname asdadsdsaasd",
      maxLines: 1,
    );
  }
}
