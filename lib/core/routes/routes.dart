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
  static const content = "/content";
  static const profile = "/profile";

// todo content creator dashboard
  static List<GetPage> get pages => [
        GetPage(
            name: index, page: () => const Meotify(), binding: WindowBinding()),
        GetPage(
          name: dashboard,
          page: () => const CreatorDashboard(),
        ),
        GetPage(
          name: home,
          page: () => const Home(),
        ),
        GetPage(
          name: content,
          page: () => const HomeContent(),
        ),
        GetPage(
          name: profile,
          page: () => const ProfilePage(),
        )
      ];
}
