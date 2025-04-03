import 'package:get/get.dart';
import 'package:meowdify/core/bindings/bind_window.dart';
import 'package:meowdify/core/presentation/meotify.dart';
import 'package:meowdify/features/music_home/presentation/pages/home.dart';

class AppRoutes {
  static const index = "/";
  static const dashboard = "/dashboard";
  static const home = "/home";

// todo content creator dashboard
  static List<GetPage> get pages => [
        GetPage(
            name: index,
            page: () => const Meotify(),
            binding: WindowBinding(),
            children: [GetPage(name: home, page: () => const Home())]),
        // GetPage(name: dashboard, page: page)
      ];
}
