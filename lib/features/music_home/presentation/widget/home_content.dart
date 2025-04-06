import 'package:flutter/material.dart';
import 'package:meowdify/core/widgets/general.dart';
import 'package:meowdify/features/music_home/presentation/widget/content/content_history.dart';
import 'package:meowdify/features/music_home/presentation/widget/content/content_promotion.dart';
import 'package:meowdify/features/music_home/presentation/widget/content/content_recommendation.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return MeoCard(
        padding: 10,
        radius: 5,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: const [
            ContentPromotion(),
            SizedBox(height: 4),
            ContentHistory(),
            SizedBox(height: 8),
            ContentRecommendation(),
            SizedBox(height: 4),
            ContentFollowedRecommendation(),
            SizedBox(height: 4),
            ContentDiscoverRecommendation()
          ],
        ));
  }
}

class ContentFollowedRecommendation extends StatelessWidget {
  const ContentFollowedRecommendation({super.key});

// 125 125
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
