import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/bindings/bind_window.dart';
import 'package:meowdify/core/presentation/widgets/app_bar/core_app_bar.dart';
import 'package:meowdify/core/presentation/widgets/navigator_bar/core_navigator_bar.dart';
import 'package:meowdify/core/routes/routes.dart';
import 'package:meowdify/core/themes/default.dart';
import 'package:meowdify/core/translations/translations.dart';
import 'package:meowdify/features/user/presentation/pages/page_login.dart';

class Meotify extends StatelessWidget {
  const Meotify({super.key});

  @override
  Widget build(BuildContext context) {
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
      home: Scaffold(
        appBar: const AppHeaderBar(),
        body: Column(
          children: [
            const CoreNavigatorBar(),
            Center(
                child: ElevatedButton(
                    onPressed: () => _showLoginDialog(context),
                    child: const Text("ingore this button w")))
          ],
        ),
      ),
    );
  }
}

void _showLoginDialog(BuildContext context) {
  Get.dialog(const LoginFrame());
}
