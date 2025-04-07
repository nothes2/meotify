import 'package:get/get.dart';

class AppRoutes {
  static const index = "/";

  static const home = "/home";
  static const content = "/content";
  static const profile = "/profile";

  static const dashboard = "/dashboard";
  static const overview = "/overview";

  static List<GetPage> get pages => [
        // GetPage(
        //     name: index, page: () => const Meotify(), binding: WindowBinding()),
        // GetPage(
        //   name: dashboard,
        //   page: () => const CreatorDashboard(),
        // ),
        // GetPage(
        //   name: home,
        //   page: () => const Home(),
        // ),
        // GetPage(
        //   name: content,
        //   page: () => const HomeContent(),
        // ),
        // GetPage(
        //   name: profile,
        //   page: () => const ProfilePage(),
        // ),
        // GetPage(
        //   name: overview,
        //   page: () => const Overview(),
        // )
      ];
}
