import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoreNavigatorBar extends StatelessWidget {
  const CoreNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset(
                    "assets/images/logo_light.svg",
                    height: 40,
                  )
                ],
              ),
            )));
  }
}
