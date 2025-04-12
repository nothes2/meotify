import 'package:get/get.dart';
import 'package:meowdify/core/presentation/widgets/app_bar/core_action_row.dart';
import 'package:window_manager/window_manager.dart';

class WindowController extends GetxController {
  var isMaxed = false.obs;

  void handleWindowAction(WindowAction action) {
    switch (action) {
      case WindowAction.close:
        windowManager.close();
        break;
      case WindowAction.minimize:
        windowManager.minimize();

        break;
      case WindowAction.maximize:
        {
          if (isMaxed.value) {
            windowManager.restore();
            isMaxed.value = false;
            return;
          }
          windowManager.maximize();
          isMaxed.value = true;
        }
        break;
    }
  }
}
