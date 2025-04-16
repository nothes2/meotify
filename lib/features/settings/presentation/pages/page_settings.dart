import 'package:flutter/material.dart';
import 'package:meowdify/core/routes/routes.dart';
import 'package:meowdify/core/utilities/navigator_key.dart';
import 'package:meowdify/core/widgets/general.dart';
import 'package:meowdify/features/settings/presentation/widgets/accounts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      SizedBox(
        width: 10,
      ),
      Expanded(
          flex: 1,
          child: MeoCard(
            radius: 5,
            padding: 10,
            child: SettingMenu(),
          )),
      SizedBox(
        width: 10,
      ),
      Expanded(
          flex: 6,
          child: MeoCard(padding: 10, radius: 5, child: CreatorContent())),
      SizedBox(
        width: 10,
      ),
    ]);
  }
}

class SettingMenu extends StatelessWidget {
  const SettingMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ListTile(
          title: const Text("Account Management"),
          onTap: () => {},
        ),
        ListTile(
          title: const Text("Preferences"),
          onTap: () => {},
        ),
      ])
    ]);
  }
}

class CreatorContent extends StatelessWidget {
  const CreatorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: creator,
      initialRoute: AppRoutes.accountManagement,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.accountManagement:
            return MaterialPageRoute(builder: (_) => const AccountManagement());
          default:
            return MaterialPageRoute(builder: (_) => const AccountManagement());
        }
      },
    );
  }
}
