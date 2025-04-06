import 'package:get/get.dart';
import 'package:meowdify/core/bindings/bind_window.dart';
import 'package:meowdify/core/presentation/meotify.dart';
import 'package:meowdify/features/music_creator/presentation/pages/music_creator.dart';
import 'package:meowdify/features/music_home/presentation/pages/home.dart';
import 'package:meowdify/features/music_home/presentation/widget/home_content.dart';
import 'package:meowdify/features/user/presentation/pages/pages_profile.dart';

class AppRoutes {
  static const index = "/";
  static const dashboard = "/dashboard";
  static const home = "/home";
  static const content = "/home/content";
  static const profile = "/home/profile";

// todo content creator dashboard
  static List<GetPage> get pages => [
        GetPage(
          name: index,
          page: () => const Meotify(),
          binding: WindowBinding(),
          participatesInRootNavigator: true,
          preventDuplicates: true,
        ),
        GetPage(
            name: dashboard,
            page: () => const CreatorDashboard(),
            participatesInRootNavigator: true,
            preventDuplicates: true,
            children: const []),
        GetPage(
            name: home,
            page: () => const Home(),
            participatesInRootNavigator: true,
            preventDuplicates: true,
            children: [
              GetPage(
                name: content,
                page: () => const HomeContent(),
                preventDuplicates: true,
              ),
              GetPage(
                name: profile,
                page: () => const ProfilePage(),
                preventDuplicates: true,
              )
            ]),
      ];
}
