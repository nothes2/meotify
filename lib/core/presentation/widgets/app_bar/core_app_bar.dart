import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/presentation/controllers/controller_window.dart';
import 'package:meowdify/core/presentation/widgets/app_bar/core_action_row.dart';
import 'package:meowdify/core/presentation/widgets/app_bar/core_leading.dart';
import 'package:window_manager/window_manager.dart';

class AppHeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const AppHeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(40.0),
      child: GestureDetector(
          onPanStart: (details) => windowManager.startDragging(),
          onDoubleTap: () {
            final controller = Get.put(WindowController());
            controller.isMaxed.value
                ? {windowManager.restore(), controller.isMaxed.value = false}
                : {windowManager.maximize(), controller.isMaxed.value = true};
          },
          child: const PrimaryAppBar()),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(24.0);
}

class PrimaryAppBar extends StatelessWidget {
  const PrimaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black87
            : Colors.white,
        leading: const AppPadding(
          child: Row(
            children: [AppBarLeading(), AppBarLeadingText()],
          ),
        ),
        leadingWidth: 100.0,
        toolbarHeight: 24,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: actionRow());
  }
}

class AppPadding extends StatelessWidget {
  final Widget child;
  const AppPadding({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: child,
    );
  }
}
