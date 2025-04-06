import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:meowdify/core/presentation/meotify.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  if (!GetPlatform.isWindows) {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      size: Size(1366, 768),
      center: true,
      titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(const Meotify());
}
