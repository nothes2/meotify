import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/bindings/bind_window.dart';
import 'package:meowdify/core/presentation/controllers/controller_auth.dart';
import 'package:meowdify/core/presentation/widgets/app_bar/core_app_bar.dart';
import 'package:meowdify/core/presentation/widgets/content/core_lib_list.dart';
import 'package:meowdify/core/presentation/widgets/navigator_bar/core_navigator_bar.dart';
import 'package:meowdify/core/routes/routes.dart';
import 'package:meowdify/core/themes/default.dart';
import 'package:meowdify/core/translations/translations.dart';
import 'package:meowdify/core/utilities/flutter_secure_storage_repo_impl.dart';
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
        initialRoute: AppRoutes.home,
        getPages: AppRoutes.pages,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: Obx(() {
          final auth = Get.find<AuthController>();

          if (auth.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!(auth.isAuthenticated.value)) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!Get.isDialogOpen!) {
                Get.dialog(const LoginFrame());
              }
            });
          }
// TODO show username and user icon after login
          return const Scaffold(
            appBar: AppHeaderBar(),
            body: Column(
              children: [
                CoreNavigatorBar(),
                MeotifyContent(),
              ],
            ),
          );
        }));
  }
}

class MeotifyContent extends StatelessWidget {
  const MeotifyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: Row(
      children: [
        Expanded(
          child: MusicLib(),
          flex: 1,
        ),
        Expanded(
          child: Placeholder(),
          flex: 3,
        ),
        Expanded(
          child: Placeholder(),
          flex: 1,
        ),
      ],
    ));
  }
}
