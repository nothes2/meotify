import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/features/user/presentation/controller/controller_register.dart';
import 'package:meowdify/features/user/presentation/pages/page_login.dart';
import 'package:meowdify/core/themes/default.dart';

class MeotifyRegButtonGroup extends StatelessWidget {
  const MeotifyRegButtonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 335,
            height: 40,
            child: Obx(() => ElevatedButton(
                  onPressed: controller.disable.value
                      ? null
                      : () => {controller.submitForm()},
                  style: controller.disable.value
                      ? AppTheme.buttonDisabledStyle(
                          Theme.of(context).brightness)
                      : ElevatedButton.styleFrom(
                          textStyle: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(inherit: true),
                          minimumSize: const Size(335, 40),
                        ),
                  child: Text('SIGN UP'.tr),
                ))),
        const SizedBox(height: 10),
        SizedBox(
          width: 335,
          height: 40,
          child: OutlinedButton(
            onPressed: () {
              Get.back();
              Get.back();
              Get.dialog(const LoginFrame());
            },
            style: ElevatedButton.styleFrom(minimumSize: const Size(335, 40)),
            child: Text('Back To Login'.tr),
          ),
        ),
      ],
    );
  }
}
