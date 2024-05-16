import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';
import 'package:login_app/src/features/auth/screens/login/login_screen.dart';
import 'package:login_app/src/features/auth/screens/signup/signup_screen.dart';
import 'package:login_app/src/features/core/controller/profile_controller.dart';
import 'package:login_app/src/features/core/screens/contacts/contacts.dart';
import 'package:login_app/src/features/core/screens/profile/profile_screen.dart';
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

                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              child: Image(
                                image: AssetImage(tProfile),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              userData.fullName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              userData.email,
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
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
            leadingIcon: Icons.phone,
            title: "Contacts",
            onTap: () => Get.to(() => const ContactsScreen()),
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
          const Divider(),
          MenuTileWidget(
              leadingIcon: Icons.settings,
              title: "Settings",
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ProfileScreen());
              }),
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
