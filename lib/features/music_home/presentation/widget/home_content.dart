import 'package:flutter/material.dart';
import 'package:meowdify/core/widgets/general.dart';
import 'package:meowdify/features/music_home/presentation/widget/content/content_promotion.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return MeoCard(
        padding: 10,
        radius: 5,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            ContentPromotion(),
            ContentHistory(),
            ContentRecommendation(),
            ContentFollowedRecommendation(),
            ContentDiscoverRecommendation()
          ],
        ));
  }
}

class ContentHistory extends StatelessWidget {
  const ContentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ContentRecommendation extends StatelessWidget {
  const ContentRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ContentFollowedRecommendation extends StatelessWidget {
  const ContentFollowedRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ContentDiscoverRecommendation extends StatelessWidget {
  const ContentDiscoverRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
