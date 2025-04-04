import 'package:flutter/material.dart';
import 'package:meowdify/features/player/presentation/widget/player_btn_group.dart';
import 'package:meowdify/features/player/presentation/widget/player_main_player.dart';
import 'package:meowdify/features/player/presentation/widget/player_meta_info.dart';

class MeoPlayer extends StatelessWidget {
  const MeoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 1, child: MetaInfo()),
        Spacer(),
        Expanded(flex: 4, child: MainPlayer()),
        Spacer(),
        Expanded(flex: 1, child: PlaylistBtnGroup())
      ],
    );
  }
}
