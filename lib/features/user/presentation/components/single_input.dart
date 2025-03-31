import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/features/user/presentation/controller/controller_debounce.dart';

class SingleInput extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function(String, String) onValueChanged;
  final String fieldName;
  final String errorText;

  final DebounceController debounceController = Get.put(DebounceController());
  SingleInput({
    super.key,
    this.controller,
    required this.keyboardType,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    required this.onValueChanged,
    required this.fieldName,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: keyboardType,
        textAlign: TextAlign.left,
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            errorText: errorText.isEmpty ? null : errorText,
            prefixIcon: Icon(prefixIcon),
            suffixIcon: Icon(suffixIcon)),
        onChanged: (value) {
          debounceController.debounceInput(value, (value) {
            onValueChanged(value, fieldName);
          });
        });
  }
}
