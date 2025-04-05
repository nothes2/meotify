import 'package:flutter/material.dart';
import 'package:meowdify/core/widgets/general.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return MeoCard(
        padding: 10,
        child: Column(
          children: [ContentPromotion()],
        ),
        radius: 5);
  }
}

class ContentPromotion extends StatelessWidget {
  const ContentPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text("a")],
    );
  }
}
