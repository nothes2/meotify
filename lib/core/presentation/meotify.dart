import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/bindings/bind_window.dart';
import 'package:meowdify/core/presentation/controllers/controller_auth.dart';
import 'package:meowdify/core/presentation/widgets/app_bar/core_app_bar.dart';
import 'package:meowdify/core/presentation/widgets/navigator_bar/core_navigator_bar.dart';
import 'package:meowdify/core/routes/routes.dart';
import 'package:meowdify/core/themes/default.dart';
import 'package:meowdify/core/translations/translations.dart';
import 'package:meowdify/core/utilities/flutter_secure_storage_repo_impl.dart';
import 'package:meowdify/core/utilities/navigator_key.dart';
import 'package:meowdify/features/music_creator/presentation/pages/music_creator.dart';
import 'package:meowdify/features/music_home/presentation/pages/home.dart';
import 'package:meowdify/features/player/presentation/pages/player.dart';
import 'package:meowdify/features/settings/presentation/pages/page_settings.dart';
import 'package:meowdify/features/user/data/repositories/impl/login_repository_impl.dart';
import 'package:meowdify/features/user/domain/usecases/login_usecase.dart';
import 'package:meowdify/features/user/presentation/controller/controller_login.dart';
import 'package:meowdify/features/user/presentation/pages/page_login.dart';

class Meotify extends StatelessWidget {
  const Meotify({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SecureStorageRepositoryImpl());
    Get.put(AuthController());
    Get.put(LoginApiImpl());
    Get.put(LoginUseCase(Get.find<LoginApiImpl>()));
    Get.put(LoginController(Get.find()));

    return GetMaterialApp(
      initialBinding: WindowBinding(),
      title: "Meotify",
      theme: AppTheme.lightTheme,
      locale: const Locale('zh', 'CN'),
      fallbackLocale: const Locale('en', 'US'),
      translations: MeoTranslations(),
      initialRoute: AppRoutes.index,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          Scaffold(
            appBar: !kIsWeb && Platform.isWindows ? const AppHeaderBar() : null,
            body: Column(
              children: [
                const CoreNavigatorBar(),
                Expanded(
                  flex: 5,
                  child: Navigator(
                    key: father,
                    initialRoute: AppRoutes.home,
                    onGenerateRoute: (settings) {
                      switch (settings.name) {
                        case AppRoutes.home:
                          return MaterialPageRoute(
                              builder: (_) => const Home());
                        case AppRoutes.dashboard:
                          return MaterialPageRoute(
                              builder: (_) => const CreatorDashboard());
                        case AppRoutes.settings:
                          return MaterialPageRoute(
                              builder: (context) => const Settings());
                        default:
                          return null;
                      }
                    },
                  ),
                ),
                const Expanded(
                  child: MeoPlayer(),
                ),
              ],
            ),
          ),
          Obx(() {
            final auth = Get.find<AuthController>();
            if (auth.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!auth.isAuthenticated.value) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!Get.isDialogOpen!) {
                  Get.dialog(const LoginFrame());
                }
              });
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
