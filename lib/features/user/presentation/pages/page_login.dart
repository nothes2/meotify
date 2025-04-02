import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/widgets/general.dart';
import 'package:meowdify/core/utilities/flutter_secure_storage_repo_impl.dart';
import 'package:meowdify/features/user/data/repositories/impl/login_repository_impl.dart';
import 'package:meowdify/features/user/domain/usecases/login_usecase.dart';
import 'package:meowdify/features/user/presentation/components/user_backdrop_filter.dart';
import 'package:meowdify/features/user/presentation/components/comp_login/user_button_fields.dart';
import 'package:meowdify/features/user/presentation/components/comp_login/user_input_fields.dart';
import 'package:meowdify/features/user/presentation/components/user_logo.dart';
import 'package:meowdify/features/user/presentation/controller/controller_login.dart';

class LoginFrame extends StatelessWidget {
  const LoginFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [CardDropFilter(), LoginWidget()],
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginApiImpl());
    Get.put(LoginUseCase(Get.find<LoginApiImpl>()));
    Get.put(LoginController(
      Get.find<LoginUseCase>(),
    ));
    Get.put(SecureStorageRepositoryImpl());

    return const Center(
        child: MeoCard(
            width: 550,
            height: 620,
            padding: 20,
            radius: 10,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MeotifyFrameLogo(),
                  UserInputFields(),
                  MeotifyLoginButtonGroup()
                ])));
  }
}

// TODO finish the login pages