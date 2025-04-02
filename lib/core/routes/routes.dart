import 'package:get/get.dart';
import 'package:meowdify/core/bindings/bind_window.dart';
import 'package:meowdify/core/presentation/meotify.dart';

class AppRoutes {
  static const home = "/";

  static List<GetPage> get pages => [
        GetPage(
            name: home, page: () => const Meotify(), binding: WindowBinding()),
      ];
}
