import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MeotifyFrameLogo extends StatelessWidget {
  const MeotifyFrameLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/images/logo_light.svg',
          height: 128,
        ),
        Text(
          'Meotify',
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
