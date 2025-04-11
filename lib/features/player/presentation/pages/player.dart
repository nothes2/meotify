import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/features/player/presentation/controller/controller_music_player.dart';
import 'package:meowdify/features/player/presentation/widget/player_btn_group.dart';
import 'package:meowdify/features/player/presentation/widget/player_main_player.dart';
import 'package:meowdify/features/player/presentation/widget/player_meta_info.dart';

class MeoPlayer extends StatelessWidget {
  const MeoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
     final audioController = Get.put(AudioController());
    return  Padding(
        padding: const  EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 1, child: MetaInfo(controller: audioController)),
            const SizedBox(width: 10),
            Expanded(flex: 3, child: MainPlayer(controller: audioController,)),
            const SizedBox(width: 10),
            Expanded(flex: 1, child: PlaylistBtnGroup(controller: audioController))
          ],
        ));
  }
}
