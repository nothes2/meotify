import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/constants/general.dart';
import 'package:meowdify/core/utilities/general.dart';
import 'package:meowdify/features/user/presentation/controller/controller_profile.dart';

/// TODO what data do i need here?
/// 1. the user data by id !
/// 2. the following information in interaction table
/// 3. the song table by uploader id!
/// 4. listen history
/// 5. album by uploader
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO finish the controller and pages
    final controller = Get.put(ProfileController());

    return Obx(() {
      return SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(() {
                return OutlinedButton(
                    onPressed: () {}, child: Text(controller.stats.value));
              })
            ],
          ),
          controller.user.value.pfp != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                      "$header/avatar/${controller.user.value.pfp}",
                      height: 128,
                      width: 128,
                      fit: BoxFit.cover))
              : const MeoShimmer(
                  hight: 120,
                  width: 120,
                ),
          Text(
            controller.user.value.username ?? "username",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(controller.user.value.bio ??
              "hello everyone! im the famous producer !"),
          const SizedBox(height: 40),
          Container(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.surface),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(controller.profileInteractionData.value.followers
                            .toString()),
                        const Text("Followers")
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(controller.profileInteractionData.value.following
                            .toString()),
                        const Text("Following")
                      ],
                    ),
                    const SizedBox(
                      width: 40,
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
              )),
          const SizedBox(
            height: 40,
          ),

          // TODO get song post by this user
          const Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Recent Tracks",
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ],
          ),
          Row(
            children: [
              _mixCard(controller),
              const SizedBox(
                width: 10,
              ),
              _mixCard(controller),
            ],
          )
        ]),
      );
    });
  }
}

Widget _mixCard(ProfileController controller) {
  return Container(
    decoration:
        BoxDecoration(color: Theme.of(Get.context!).colorScheme.surface),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Row(
      children: [
        Image.network(
          "https://images.unsplash.com/photo-1742590794310-04fc4d2025f2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8",
          height: 36,
          width: 36,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "this is a very long title",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "title",
              style: TextStyle(fontSize: 12),
            ),
          ],
        )
      ],
    ),
  );
}
