import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/features/user/presentation/components/single_input.dart';
import 'package:meowdify/features/user/presentation/controller/controller_register.dart';

class RegInputFields extends StatelessWidget {
  const RegInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    const height = 80.0;
    var controller = Get.find<RegisterController>();
    return Column(
      children: [
        Text(
          "SIGN UP".tr,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 24),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: height,
                width: 335,
                child: Obx(() => SingleInput(
                      keyboardType: TextInputType.text,
                      label: "Username".tr,
                      prefixIcon: Icons.supervised_user_circle,
                      controller: controller.usernameController,
                      onValueChanged: controller.onValueChanged,
                      fieldName: "username",
                      errorText: controller.usernameError.value,
                    ))),
            const SizedBox(height: 10),
            SizedBox(
              height: height,
              width: 335,
              child: Obx(() => SingleInput(
                    keyboardType: TextInputType.emailAddress,
                    label: "Email Address".tr,
                    prefixIcon: Icons.email,
                    controller: controller.emailController,
                    onValueChanged: controller.onValueChanged,
                    fieldName: "email",
                    errorText: controller.emailError.value,
                  )),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: height,
                width: 335,
                child: Obx(() => SingleInput(
                      keyboardType: TextInputType.visiblePassword,
                      label: "Password".tr,
                      onValueChanged: controller.onValueChanged,
                      fieldName: "password",
                      controller: controller.passwordController,
                      prefixIcon: Icons.password,
                      suffixIcon: Icons.remove_red_eye,
                      errorText: controller.passwordError.value,
                    ))),
            const SizedBox(height: 10),
            SizedBox(
                height: height,
                width: 335,
                child: Obx(() => SingleInput(
                      keyboardType: TextInputType.visiblePassword,
                      label: "Confirm Password".tr,
                      prefixIcon: Icons.password,
                      suffixIcon: Icons.remove_red_eye,
                      onValueChanged: controller.onValueChanged,
                      fieldName: "confirmPassword",
                      errorText: controller.confirmPasswordError.value,
                    ))),
          ],
        )
      ],
    );
  }
}
