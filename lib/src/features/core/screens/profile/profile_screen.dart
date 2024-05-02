import 'package:flutter/material.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/core/screens/profile/widgets/menu_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: Text(
          "Profile",
          style: textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 70,
                foregroundImage: AssetImage(tProfile),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Tashfeen Chohan",
                style: textTheme.headlineMedium,
              ),
              Text(
                "chohantashfeen@gmail.com",
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButtonWidget(
                text: "Edit Profile",
                width: 150,
                onPressed: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(height: 20),
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
