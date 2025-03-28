import 'dart:ui';

import 'package:flutter/material.dart';

class CardDropFilter extends StatelessWidget {
  const CardDropFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
