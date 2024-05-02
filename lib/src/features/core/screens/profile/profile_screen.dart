import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/core/screens/profile/widgets/profile_header.dart';
import 'package:login_app/src/features/core/screens/profile/widgets/menu_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const ProfileHeaderWidget(),
              // MENU
              ProfileMenuWidget(
                icon: Icons.settings,
                title: "Settings",
                onTap: () {},
              ),
              ProfileMenuWidget(
                icon: Icons.money,
                title: "Billing Details",
                onTap: () {},
              ),
              ProfileMenuWidget(
                icon: Icons.supervised_user_circle_sharp,
                title: "User Managment",
                onTap: () {},
              ),
              const Divider(),
              ProfileMenuWidget(
                icon: Icons.info,
                title: "Information",
                onTap: () {},
              ),
              ProfileMenuWidget(
                icon: Icons.logout_outlined,
                title: "Logout",
                titleColor: Colors.red,
                endIcon: false,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
