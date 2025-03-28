import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeotifyFrameButtonGroup extends StatelessWidget {
  const MeotifyFrameButtonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 335,
          height: 40,
          child: Expanded(
              child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('SIGN IN'.tr),
          )),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 335,
          height: 40,
          child: Expanded(
              child: OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Close'),
          )),
        ),
      ],
    );
  }
}
