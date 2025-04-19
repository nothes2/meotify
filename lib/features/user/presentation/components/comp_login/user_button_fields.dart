import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/utilities/colors.dart';
import 'package:meowdify/features/user/presentation/controller/controller_login.dart';
import 'package:meowdify/features/user/presentation/pages/page_register.dart';
import 'package:meowdify/core/themes/default.dart';

class MeotifyLoginButtonGroup extends StatelessWidget {
  const MeotifyLoginButtonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();
    return Column(
      children: [
        SizedBox(
            width: 335,
            height: 40,
            child: Obx(() => ElevatedButton(
                  onPressed: controller.isButtonDisable()
                      ? null
                      : () => {controller.login()},
                  style: controller.isButtonDisable()
                      ? AppTheme.buttonDisabledStyle(
                          Theme.of(context).brightness)
                      : ElevatedButton.styleFrom(
                          textStyle: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(inherit: true),
                          minimumSize: const Size(335, 40),
                        ),
                  child: Text('SIGN IN'.tr,
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.pure
                              : AppColors.pureDark)),
                ))),
        const SizedBox(height: 10),
        SizedBox(
          width: 335,
          height: 40,
          child: OutlinedButton(
            onPressed: () {
              Get.back();
              Get.dialog(const ReigsterFrame());
            },
            style: ElevatedButton.styleFrom(minimumSize: const Size(335, 40)),
            child: Text('Register by Email'.tr),
          ),
        ),
      ],
    );
  }
}
