import 'package:get/get.dart';
import 'package:meowdify/core/presentation/controllers/controller_toggle.dart';
import 'package:meowdify/core/presentation/controllers/controller_window.dart';
import 'package:meowdify/core/utilities/flutter_secure_storage_repo_impl.dart';

class WindowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WindowController>(() => WindowController());
    Get.lazyPut<ToggleController>(() => ToggleController());
    Get.lazyPut<SecureStorageRepositoryImpl>(
        () => SecureStorageRepositoryImpl());
  }
}
