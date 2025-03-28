import 'package:get/get.dart';
import 'package:meowdify/core/bindings/bind_window.dart';
import 'package:meowdify/core/presentation/meotify.dart';

class AppRoutes {
  static const index = "/";
  static const home = "/home";
  static List<GetPage> get pages => [
        GetPage(
            name: index, page: () => const Meotify(), binding: WindowBinding())
      ];
}
