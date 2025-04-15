import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meowdify/core/widgets/effect.dart';

class MeoCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final double padding;
  final double radius;
  final Widget child;
  const MeoCard(
      {super.key,
      this.height,
      this.width,
      this.color,
      required this.padding,
      required this.child,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: cardShadow(context),
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black87
            : Colors.white,
      ),
      child: child,
    );
  }
}

double generateNumber() {
  final random = Random();
  return random.nextInt(101).toDouble();
}
