import 'package:get/get.dart';
import 'package:meowdify/core/presentation/controllers/controller_toggle.dart';
import 'package:meowdify/core/presentation/controllers/controller_window.dart';

class WindowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WindowController>(() => WindowController());
    Get.lazyPut<ToggleController>(() => ToggleController());
  }
}
