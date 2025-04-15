import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meowdify/core/utilities/colors.dart';

class CardDropFilter extends StatelessWidget {
  const CardDropFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.pureDark
              : AppColors.pure,
        ),
      ),
    );
  }
}
