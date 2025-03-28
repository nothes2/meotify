import 'package:get/get.dart';

class ToggleController extends GetxController {
  var toggle = false.obs;

  void funcToggle() {
    toggle.value = !(toggle.value);
  }
}
