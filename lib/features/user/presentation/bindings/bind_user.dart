import 'package:get/get.dart';
import 'package:meowdify/features/user/data/repositories/impl/flutter_secure_storage_repo_impl.dart';
import 'package:meowdify/features/user/data/repositories/impl/login_repository_impl.dart';
import 'package:meowdify/features/user/domain/usecases/login_usecase.dart';
import 'package:meowdify/features/user/presentation/controller/controller_login.dart';

class UserBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginApiImpl());
    Get.put(LoginUseCase(Get.find<LoginApiImpl>()));
    Get.put(LoginController(
      Get.find<LoginUseCase>(),
    ));
    Get.put(SecureStorageRepositoryImpl());
  }
}
