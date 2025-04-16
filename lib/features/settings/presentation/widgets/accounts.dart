import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/utilities/general.dart';
import 'package:meowdify/features/settings/presentation/controller/controller_account.dart';
import 'package:meowdify/features/user/presentation/pages/page_login.dart';

class AccountManagement extends StatelessWidget {
  const AccountManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AccountController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.surface),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Obx(() {
                        return controller.user.value.pfp != null
                            ? Image.network(
                                controller.user.value.pfp ?? "",
                                height: 88,
                                width: 88,
                                fit: BoxFit.cover,
                              )
                            : const MeoShimmer(
                                hight: 88,
                                width: 88,
                              );
                      })),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(() {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.user.value.username ?? "username",
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(controller.user.value.email ?? "email"),
                      ],
                    );
                  })
                ],
              ),
              TextButton(
                  onPressed: () {
                    Get.dialog(_editDialog());
                  },
                  child: const Text("Edit"))
            ],
          ),
        ),
        const SizedBox(height: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              child: const Text("change password"),
              onTap: () {
                Get.dialog(_passwordChangDialog());
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: const Text("sign out"),
              onTap: () {
                Get.dialog(_logoutDialog(controller));
              },
            )
          ],
        )
      ],
    );
  }
}

// profile edit dialog
Widget _passwordChangDialog() {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    child: Container(
      padding: const EdgeInsets.all(20),
      width: 600,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Change Password',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Old Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'New Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  // Handle cancel action
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle change password action
                },
                child: const Text('Change'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _editDialog() {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    child: Container(
      width: 600,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Edit Account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  // Handle cancel action
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle edit action
                },
                child: Text('Edit'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _logoutDialog(AccountController controller) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Container(
      width: 400,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Confirm Logout',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Are you sure you want to logout?',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  controller.logout();

                  Get.dialog(const LoginFrame());
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
