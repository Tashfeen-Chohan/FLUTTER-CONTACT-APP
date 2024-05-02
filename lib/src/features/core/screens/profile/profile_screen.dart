import 'package:flutter/material.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';

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
              SizedBox(
                width: 150,
                child: ElevatedButtonWidget(
                  text: "Edit Profile",
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
