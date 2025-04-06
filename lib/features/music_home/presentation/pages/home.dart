import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/routes/routes.dart';
import 'package:meowdify/features/music_home/presentation/widget/home_content.dart';
import 'package:meowdify/features/music_home/presentation/widget/home_detail.dart';
import 'package:meowdify/features/music_home/presentation/widget/home_lib_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> second = GlobalKey();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: MusicLib(),
          ),
          Expanded(
            flex: 3,
            child: Navigator(
              initialRoute: AppRoutes.content,
              key: second,
              // TODO fix this route
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case AppRoutes.content:
                    const HomeContent();
                    break;
                }
              },
            ),
          ),
          const Expanded(
            flex: 1,
            child: DetailPanel(),
          ),
        ],
      ),
    );
  }
}
