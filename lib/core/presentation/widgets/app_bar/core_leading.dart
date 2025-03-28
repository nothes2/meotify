import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo_light.svg',
      height: 24.0,
      width: 24.0,
    );
  }
}

class AppBarLeadingText extends StatelessWidget {
  const AppBarLeadingText({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text(
      'MEOTIFY',
      style: TextStyle(fontSize: 12.0),
      textAlign: TextAlign.center,
    );
  }
}
