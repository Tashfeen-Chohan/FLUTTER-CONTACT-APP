import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/core/screens/dashboard/dashboard.dart';
import 'package:login_app/src/features/core/screens/profile/profile_screen.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(
              accountName: Text("Tashfeen Chohan"),
              accountEmail: Text("chohantashfeen@gmail.com"),
              currentAccountPicture: CircleAvatar(
                radius: 10,
                foregroundImage: AssetImage(tProfile),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "App Menu",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          MenuTileWidget(
            leadingIcon: Icons.home,
            title: "Dashboard",
            onTap: () => Get.to(() => const Dashboard()),
          ),
          MenuTileWidget(
            leadingIcon: Icons.settings,
            title: "Settings",
            onTap: () => Get.to(() => const ProfileScreen()),
          ),
          const Divider(),
          MenuTileWidget(
            leadingIcon: Icons.logout,
            title: "Logout",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class MenuTileWidget extends StatelessWidget {
  const MenuTileWidget({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.onTap,
  });

  final IconData leadingIcon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(leadingIcon),
      title: Text(title),
    );
  }
}
