import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/routes/routes.dart';
import 'package:meowdify/core/utilities/navigator_key.dart';
import 'package:meowdify/core/widgets/general.dart';
import 'package:meowdify/features/music_creator/presentation/controller/creator_select_menu_controller.dart';
import 'package:meowdify/features/music_creator/presentation/widget/music/music_management.dart';
import 'package:meowdify/features/music_creator/presentation/widget/music/music_upload.dart';
import 'package:meowdify/features/music_creator/presentation/widget/overview.dart';

class CreatorDashboard extends StatelessWidget {
  const CreatorDashboard({super.key});

// TODO finish this next
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
            child: CreatorMenu(),
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

class CreatorMenu extends StatelessWidget {
  const CreatorMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectMenuController());

    return ListView(
      children: controller.menuData.entries.map((entry) {
        final title = entry.key;
        final children = entry.value;

        return Obx(() {
          final isExpanded = controller.expandedMenu.value == title;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(title),
                trailing:
                    Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                onTap: () => controller.toggleMenu(title),
              ),
              if (isExpanded)
                ...children.map((subItem) => Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: ListTile(
                        title: Text(subItem),
                        onTap: () {
                          switch (subItem) {
                            case "Overview":
                              creator.currentState
                                  ?.pushReplacementNamed(AppRoutes.overview);
                              break;
                            case "Management":
                              creator.currentState?.pushReplacementNamed(
                                  AppRoutes.musicManagement);
                            case "Upload":
                              creator.currentState
                                  ?.pushReplacementNamed(AppRoutes.musicupload);
                              break;
                            default:
                          }
                        },
                      ),
                    )),
            ],
          );
        });
      }).toList(),
    );
  }
}

class CreatorContent extends StatelessWidget {
  const CreatorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: creator,
      initialRoute: AppRoutes.overview,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.overview:
            return MaterialPageRoute(builder: (_) => const Overview());
          case AppRoutes.musicupload:
            return MaterialPageRoute(builder: (_) => const MusicUpload());
          case AppRoutes.musicManagement:
            return MaterialPageRoute(builder: (_) => const MusicManagement());
          default:
            return MaterialPageRoute(builder: (_) => const Overview());
        }
      },
    );
  }
}
