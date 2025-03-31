import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/features/user/presentation/components/single_input.dart';
import 'package:meowdify/features/user/presentation/controller/controller_login.dart';

class UserInputFields extends StatelessWidget {
  const UserInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Column(
      children: [
        Text(
          "SIGN IN".tr,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 24),
        ),
        const SizedBox(height: 20),
        SizedBox(
            height: 80,
            width: 335,
            child: Obx(() => SingleInput(
                  keyboardType: TextInputType.emailAddress,
                  label: "Email Address".tr,
                  prefixIcon: Icons.email,
                  controller: controller.emailController,
                  onValueChanged: controller.onValueChanged,
                  fieldName: "email",
                  errorText: controller.emailError.value,
                ))),
        const SizedBox(height: 10),
        SizedBox(
            height: 80,
            width: 335,
            child: Obx(() => SingleInput(
                  keyboardType: TextInputType.emailAddress,
                  label: "Password".tr,
                  prefixIcon: Icons.password,
                  suffixIcon: Icons.remove_red_eye,
                  controller: controller.passwordController,
                  onValueChanged: controller.onValueChanged,
                  fieldName: "password",
                  errorText: controller.passwordError.value,
                )))
      ],
    );
  }
}
