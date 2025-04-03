// TODO move the mainpage here to split the content_creator area and here

import 'package:flutter/material.dart';
import 'package:meowdify/features/music_home/presentation/widget/home_content.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [MeotifyContent()],
    );
  }
}
