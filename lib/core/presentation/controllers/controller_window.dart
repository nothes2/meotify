import 'package:get/get.dart';
import 'package:meowdify/core/presentation/widgets/app_bar/core_action_row.dart';
import 'package:window_manager/window_manager.dart';
import 'package:meowdify/core/presentation/controllers/controller_toggle.dart';

class WindowController extends GetxController {
  void handleWindowAction(WindowAction action) {
    switch (action) {
      case WindowAction.close:
        windowManager.close();
        break;
      case WindowAction.minimize:
        windowManager.minimize();
        break;
      case WindowAction.maximize:
        final toggle = Get.find<ToggleController>().toggle;
        toggle.value ? windowManager.restore() : windowManager.maximize();
        Get.find<ToggleController>().funcToggle();
        break;
      default:
    }
  }
}
