import 'dart:async';
import 'package:get/get.dart';

class DebounceController extends GetxController {
  Timer? _debounce;

  void debounceInput(String value, Function(String) onValidInput,
      {int delayInMilliseconds = 300}) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(Duration(milliseconds: delayInMilliseconds), () {
      onValidInput(value);
    });
  }
}
