import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/utilities/general.dart';
import 'package:meowdify/features/user/presentation/controller/controller_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO controller
    final controller = Get.put(ProfileController());

    return Obx(() {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(() {
              return TextButton(
                  onPressed: () {}, child: Text(controller.stats.value));
            })
          ],
        ),
        controller.user.value.pfp == null
            ? Image.network("")
            : const MeoShimmer(
                hight: 120,
                width: 120,
              ),
        Text(
          controller.user.value.username ?? "",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(controller.user.value.bio ?? ""),
        Container(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.surface),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.profileInteractionData.value.followers
                          .toString()),
                      const Text("Followers")
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.profileInteractionData.value.following
                          .toString()),
                      const Text("Following")
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.profileInteractionData.value.listeners
                          .toString()),
                      const Text("Listeners")
                    ],
                  ),
                ],
              ),
            ))
      ]);
    });
  }
}
