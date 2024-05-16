import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/bottom_nav.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';
import 'package:login_app/src/features/core/controller/profile_controller.dart';
import 'package:login_app/src/features/core/screens/contacts/contacts.dart';
import 'package:login_app/src/features/core/screens/contacts/new_contact.dart';
import 'package:login_app/src/features/core/screens/profile/update_profile.dart';
import 'package:login_app/src/features/core/screens/profile/widgets/menu_widget.dart';
import 'package:login_app/src/features/core/screens/users/users_screen.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _handleLogout() {
    AuthRepository.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Profile",
          style: textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: MyBottomNav(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              // const ProfileHeaderWidget(),
              Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 70,
                        foregroundImage: AssetImage(tProfile),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(
                            Icons.mode_edit_outline_outlined,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                      future: controller.getUserData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            UserModel userData = snapshot.data as UserModel;
                            return Column(
                              children: [
                                Text(
                                  userData.fullName,
                                  style: textTheme.headlineMedium,
                                ),
                                Text(
                                  userData.email,
                                  style: textTheme.bodyMedium,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButtonWidget(
                                  text: "Edit Profile",
                                  width: 150,
                                  onPressed: () =>
                                      Get.to(() => const UpdateProfileScreen()),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(),
                                const SizedBox(height: 20),
                                ProfileMenuWidget(
                                  icon: Icons.add,
                                  title: "New Contact",
                                  onTap: () {
                                    Get.to(() => const NewContactScreen());
                                  },
                                ),
                                ProfileMenuWidget(
                                  icon: Icons.phone,
                                  title: "Contacts",
                                  onTap: () {
                                    Get.to(() => const ContactsScreen());
                                  },
                                ),
                                userData.email == "chohantashfeen@gmail.com" ||
                                        userData.email == "anas@gmail.com"
                                    ? ProfileMenuWidget(
                                        icon:
                                            Icons.supervised_user_circle_sharp,
                                        title: "User Managment",
                                        onTap: () {
                                          Get.to(() => const UsersScreen());
                                        },
                                      )
                                    : const SizedBox(),
                                const Divider(),
                                ProfileMenuWidget(
                                  icon: Icons.settings,
                                  title: "Settings",
                                  onTap: () {
                                    Get.to(() => const UpdateProfileScreen());
                                  },
                                ),
                                ProfileMenuWidget(
                                  icon: Icons.logout_outlined,
                                  title: "Logout",
                                  titleColor: Colors.red,
                                  endIcon: false,
                                  onTap: _handleLogout,
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return const Center(
                              child: CircularProgressIndicator(),
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
                ],
              ),

              // MENU
            ],
          ),
        ),
      ),
    );
  }
}
