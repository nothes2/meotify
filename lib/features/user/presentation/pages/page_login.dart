import 'package:flutter/material.dart';
import 'package:meowdify/core/widgets/general.dart';
import 'package:meowdify/features/user/presentation/components/user_backdrop_filter.dart';
import 'package:meowdify/features/user/presentation/components/user_button_fields.dart';
import 'package:meowdify/features/user/presentation/components/user_input_fields.dart';
import 'package:meowdify/features/user/presentation/components/user_logo.dart';

class LoginFrame extends StatelessWidget {
  const LoginFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [CardDropFilter(), LoginWidget()],
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: MeoCard(
            width: 550,
            height: 620,
            padding: 20,
            radius: 10,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MeotifyFrameLogo(),
                  UserInputFields(),
                  MeotifyFrameButtonGroup()
                ])));
  }
}

// TODO finish the login pages