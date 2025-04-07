import 'package:get/get.dart';

class SelectMenuController extends GetxController {
  final Map<String, List<String>> menuData = {
    'Dashboard': ["Overview"],
    'My Music': ["Upload", "Management"],
  };

  var expandedMenu = ''.obs;

  void toggleMenu(String menu) {
    expandedMenu.value = expandedMenu.value == menu ? '' : menu;
  }
}
