import 'package:flutter/material.dart';
import 'package:meowdify/core/utilities/general.dart';
import 'package:meowdify/core/widgets/general.dart';

class ContentRecommendation extends StatelessWidget {
  const ContentRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> recommendations = [
      {"title": "Title 1", "description": "Description 1"},
      {"title": "Title 2", "description": "Description 2"},
      {"title": "Title 3", "description": "Description 3"},
      {"title": "Title 4", "description": "Description 4"},
      {"title": "Title 4", "description": "Description 4"},
      {"title": "Title 4", "description": "Description 4"},
      {"title": "Title 4", "description": "Description 4"},
      {"title": "Title 4", "description": "Description 4"},
      {"title": "Title 4", "description": "Description 4"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Good {TIME}, It's {DATE}, Let's Listen some music!",
          textAlign: TextAlign.start,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...recommendations.map((item) => RecommendationCard(
                    title: item["title"]!,
                    description: item["description"]!,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class RecommendationCard extends StatelessWidget {
  final String title;
  final String description;

  const RecommendationCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: MeoCard(
        padding: 0,
        radius: 4,
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            const MeoShimmer(hight: 160, width: 160),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
