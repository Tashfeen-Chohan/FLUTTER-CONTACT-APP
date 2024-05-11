import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';
import 'package:login_app/src/features/auth/screens/login/login_screen.dart';
import 'package:login_app/src/features/auth/screens/signup/signup_screen.dart';
import 'package:login_app/src/features/core/screens/dashboard/dashboard.dart';
import 'package:login_app/src/features/core/screens/profile/profile_screen.dart';
import 'package:login_app/src/features/core/screens/users/users_screen.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    
    GetStorage storage = GetStorage();
    UserModel userData = storage.read("userData");
    final authRepo = Get.put(AuthRepository());
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              accountName: Text(userData.fullName),
              accountEmail: Text(userData.email),
              currentAccountPicture: const CircleAvatar(
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
            leadingIcon: Icons.phone,
            title: "Contacts",
            onTap: () => Get.to(() => const Dashboard()),
          ),
          (userData.email == "chohantashfeen@gmail.com" ||
                  userData.email == "anas@gmail.com")
              ? MenuTileWidget(
                  leadingIcon: Icons.group,
                  title: "Users",
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(() => const UsersScreen());
                  },
                )
              : const SizedBox(),
          MenuTileWidget(
            leadingIcon: Icons.login_sharp,
            title: "Login",
            onTap: () {
              Navigator.pop(context);
              Get.to(() => const LoginScreen());
            },
          ),
          MenuTileWidget(
              leadingIcon: Icons.person_add,
              title: "Signup",
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const SignupScreen());
              }),
          MenuTileWidget(
              leadingIcon: Icons.settings,
              title: "Settings",
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ProfileScreen());
              }),
          const Divider(),
          MenuTileWidget(
            leadingIcon: Icons.logout,
            title: "Logout",
            titleColor: Colors.red,
            onTap: () async {
              await authRepo.signOut();
            },
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
    this.titleColor = Colors.black,
    this.onTap,
  });

  final IconData leadingIcon;
  final String title;
  final Color? titleColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: tAccentColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          leadingIcon,
          color: tAccentColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: titleColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
