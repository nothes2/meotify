import 'package:get/get.dart';

class SelectMenuController extends GetxController {
  final Map<String, List<String>> menuData = {
    'Dashboard'.tr: ["Overview".tr],
    'My Music'.tr: ["Upload".tr, "Management".tr],
  };

  var expandedMenu = ''.obs;

  void toggleMenu(String menu) {
    expandedMenu.value = expandedMenu.value == menu ? '' : menu;
  }
}
