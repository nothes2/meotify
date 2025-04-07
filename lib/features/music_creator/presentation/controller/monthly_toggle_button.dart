import 'package:get/get.dart';

class OverviewController extends GetxController {
  var isMonthly = false.obs;

  void toggleView(bool monthly) {
    isMonthly.value = monthly;
  }
}
