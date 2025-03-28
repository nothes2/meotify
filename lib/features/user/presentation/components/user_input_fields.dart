import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInputFields extends StatelessWidget {
  const UserInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "SIGN IN".tr,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 24),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 40,
          width: 335,
          child: SingleInput(
            keyboardType: TextInputType.emailAddress,
            label: "Email Address".tr,
            prefixIcon: Icons.email,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
            height: 40,
            width: 335,
            child: SingleInput(
              keyboardType: TextInputType.emailAddress,
              label: "Password".tr,
              prefixIcon: Icons.password,
              suffixIcon: Icons.remove_red_eye,
            ))
      ],
    );
  }
}

class SingleInput extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const SingleInput(
      {super.key,
      this.controller,
      required this.keyboardType,
      required this.label,
      required this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: keyboardType,
        textAlign: TextAlign.left,
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(prefixIcon),
            suffixIcon: Icon(suffixIcon)));
  }
}
