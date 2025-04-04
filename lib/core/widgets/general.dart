import 'package:flutter/material.dart';
import 'package:meowdify/core/widgets/effect.dart';

class MeoCard extends StatelessWidget {
  final double? height;
  final double? width;
  final double padding;
  final double radius;
  final Widget child;
  const MeoCard(
      {super.key,
      this.height,
      this.width,
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
        color: Colors.white,
      ),
      child: child,
    );
  }
}
