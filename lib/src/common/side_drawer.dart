import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';
import 'package:login_app/src/features/auth/screens/login/login_screen.dart';
import 'package:login_app/src/features/auth/screens/signup/signup_screen.dart';
import 'package:login_app/src/features/core/controller/profile_controller.dart';
import 'package:login_app/src/features/core/screens/contacts/contacts.dart';
import 'package:login_app/src/features/core/screens/dashboard/dashboard.dart';
import 'package:login_app/src/features/core/screens/profile/profile_screen.dart';
import 'package:login_app/src/features/core/screens/users/users_screen.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final authRepo = Get.put(AuthRepository());
    // GetStorage storage = GetStorage();
    // UserModel userData = storage.read("userData");
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: FutureBuilder(
                future: controller.getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      UserModel userData = snapshot.data as UserModel;

                      return UserAccountsDrawerHeader(
                        decoration: const BoxDecoration(
                            // color: tAccentColor.withOpacity(0.6),
                            color: Colors.blue),
                        accountName: Text(
                          userData.fullName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        accountEmail: Text(userData.email),
                        currentAccountPicture: const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(tProfile),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text("Something went wrong!"),
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
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
            onTap: () => Get.to(() => const ContactsScreen()),
          ),
          // MenuTileWidget(
          //   leadingIcon: Icons.edit_calendar_outlined,
          //   title: "Edit Contact",
          //   onTap: () => Get.to(() => const EditContactScreen()),
          // ),
          // MenuTileWidget(
          //   leadingIcon: Icons.contact_emergency,
          //   title: "View Contact",
          //   onTap: () {
          //     Navigator.pop(context);
          //     Get.to(() => const ViewContactScreen());
          //   },
          // ),
          MenuTileWidget(
            leadingIcon: Icons.group,
            title: "Users",
            onTap: () {
              Navigator.pop(context);
              Get.to(() => const UsersScreen());
            },
          ),
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
