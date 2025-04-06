import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/presentation/controllers/controller_auth.dart';
import 'package:meowdify/core/routes/routes.dart';
import 'package:meowdify/core/utilities/navigator_key.dart';
import 'package:meowdify/core/widgets/effect.dart';
import 'package:meowdify/features/user/presentation/pages/pages_profile.dart';

BoxDecoration coreNaviBoxDoc(BuildContext context) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
      boxShadow: cardShadow(context));
}

class CoreNavigatorBar extends StatelessWidget {
  const CoreNavigatorBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            height: 60,
            decoration: coreNaviBoxDoc(context),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: UserInfo(),
                          onTap: () => {
                            child.currentState?.push(
                              MaterialPageRoute(
                                  builder: (_) => const ProfilePage()),
                            )
                          },
                        )),
                    SizedBox(width: 10),
                    Expanded(flex: 3, child: MeotifySearchBar()),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(flex: 1, child: MeotifyTools())
                  ]),
            )));
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() {
          final user = authController.user;
          return Row(
            children: [
              SvgPicture.asset(
                user.value?.pfp ?? "assets/images/icon/ic_user.svg",
                height: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                user.value?.username ?? "Guest",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          );
        }),
        IconButton.filled(
          onPressed: () {
            child.currentState?.pushNamed("/content");
          },
          icon: const Icon(
            Icons.home,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class MeotifySearchBar extends StatelessWidget {
  const MeotifySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Icon(Icons.search)),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2),
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(20),
                        right: Radius.circular(20),
                      )),
                )))
      ],
    );
  }
}

class MeotifyTools extends StatelessWidget {
  const MeotifyTools({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton.outlined(
            onPressed: () {}, icon: const Icon(Icons.notifications)),
        const SizedBox(
          width: 10,
        ),
        IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.email)),
        const SizedBox(
          width: 10,
        ),
        IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
    );
  }
}
