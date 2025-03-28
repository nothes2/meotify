import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/presentation/controllers/controller_window.dart';
import 'package:meowdify/core/presentation/widgets/app_bar/core_app_bar.dart';

List<Widget> actionRow() {
  return const [
    AppPadding(
        child: ActionIcon(
            iconData: Icons.minimize, action: WindowAction.minimize)),
    AppPadding(
        child: ActionIcon(
            iconData: Icons.fullscreen, action: WindowAction.maximize)),
    AppPadding(
        child: ActionIcon(
      iconData: Icons.close,
      action: WindowAction.close,
    )),
  ];
}

enum WindowAction { close, minimize, maximize }

class ActionIcon extends StatelessWidget {
  final WindowAction action;
  final IconData iconData;
  const ActionIcon({super.key, required this.iconData, required this.action});

  @override
  Widget build(BuildContext context) {
    final WindowController windowController = Get.find();
    return GestureDetector(
      onTap: () => {windowController.handleWindowAction(action)},
      child: Icon(iconData,
          color: Theme.of(context).colorScheme.primary, size: 20),
    );
  }
}
