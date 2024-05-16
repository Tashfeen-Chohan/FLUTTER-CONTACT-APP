import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/bottom_nav.dart';
import 'package:login_app/src/features/core/screens/contacts/contacts.dart';
import 'package:login_app/src/features/core/screens/contacts/new_contact.dart';
import 'package:login_app/src/features/core/screens/profile/update_profile.dart';
import 'package:login_app/src/features/core/screens/profile/widgets/profile_header.dart';
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
              const ProfileHeaderWidget(),
              // MENU

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
              ProfileMenuWidget(
                icon: Icons.supervised_user_circle_sharp,
                title: "User Managment",
                onTap: () {
                  Get.to(() => const UsersScreen());
                },
              ),
              const Divider(),
              ProfileMenuWidget(
                icon: Icons.settings,
                title: "Settings",
                onTap: () {
                  Get.to(() => const UpdateProfile());
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
          ),
        ),
      ),
    );
  }
}
