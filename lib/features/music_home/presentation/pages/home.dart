import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/routes/routes.dart';
import 'package:meowdify/features/music_home/presentation/widget/home_lib_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: MusicLib(),
        ),
        Expanded(
          flex: 3,
          child: GetRouterOutlet(
            anchorRoute: AppRoutes.home,
            initialRoute: AppRoutes.content,
          ),
        ),
        const Expanded(
          flex: 1,
          child: Placeholder(), // TODO: Replace with detail card
        ),
      ],
    );
  }
}
