import 'package:get/get.dart';
import 'package:meowdify/core/presentation/meotify.dart';
import 'package:meowdify/features/user/presentation/bindings/bind_user.dart';
import 'package:meowdify/features/user/presentation/pages/page_login.dart';

class AppRoutes {
  static const home = "/";
  static const login = "/login";

  static List<GetPage> get pages => [
        GetPage(name: home, page: () => const Meotify()),
        GetPage(
          name: login,
          page: () => const LoginFrame(),
          binding: UserBindings(),
        )
      ];
}
