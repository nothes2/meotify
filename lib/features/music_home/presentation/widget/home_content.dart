import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/features/music_home/presentation/widget/home_lib_list.dart';

class MeotifyContent extends StatelessWidget {
  const MeotifyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        Expanded(
          child: MusicLib(),
          flex: 1,
        ),
        // TODO an routeoutlet should here
        Expanded(flex: 3, child: const Placeholder()),
        Expanded(
          child: Placeholder(),
          flex: 1,
        ),
      ],
    ));
  }
}
