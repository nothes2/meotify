import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/widgets/general.dart';
import 'package:meowdify/features/user/data/repositories/impl/register_repository_impl.dart';
import 'package:meowdify/features/user/domain/usecases/register_usecase.dart';
import 'package:meowdify/features/user/presentation/components/comp_register/reg_button_fields.dart';
import 'package:meowdify/features/user/presentation/components/comp_register/reg_input_fields.dart';
import 'package:meowdify/features/user/presentation/components/user_backdrop_filter.dart';
import 'package:meowdify/features/user/presentation/components/user_logo.dart';
import 'package:meowdify/features/user/presentation/controller/controller_register.dart';

class ReigsterFrame extends StatelessWidget {
  const ReigsterFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [CardDropFilter(), RegisterWidget()],
      ),
    );
  }
}

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterApiImpl());
    Get.put(RegisterUsecase(Get.find<RegisterApiImpl>()));
    Get.put(RegisterController(Get.find<RegisterUsecase>()));
    return const Center(
        child: MeoCard(
            width: 720,
            height: 620,
            padding: 20,
            radius: 10,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MeotifyFrameLogo(),
                  RegInputFields(),
                  MeotifyRegButtonGroup()
                ])));
  }
}
