import 'package:flutter/material.dart';
import 'package:meowdify/core/routes/routes.dart';
import 'package:meowdify/core/utilities/navigator_key.dart';
import 'package:meowdify/features/music_home/presentation/widget/home_content.dart';
import 'package:meowdify/features/music_home/presentation/widget/home_detail.dart';
import 'package:meowdify/features/music_home/presentation/widget/home_lib_list.dart';
import 'package:meowdify/features/user/presentation/pages/pages_profile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: MusicLib(),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 3,
            child: Navigator(
              initialRoute: AppRoutes.content,
              key: home,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case AppRoutes.content:
                    return MaterialPageRoute(
                      builder: (context) => const HomeContent(),
                    );
                  case AppRoutes.profile:
                    return MaterialPageRoute(
                        builder: (context) => const ProfilePage());
                  default:
                    return MaterialPageRoute(
                      builder: (context) => const HomeContent(),
                    );
                }
              },
            ),
          ),
          const SizedBox(
            width: 10,
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
