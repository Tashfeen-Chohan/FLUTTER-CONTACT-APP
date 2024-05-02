import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/common/textfield_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

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
          "Update Profile",
          style: textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
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
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              const TextfieldWidget(
                label: "Username",
                hintText: "Full Name",
                prefixIcon: Icons.verified_user_rounded,
              ),
              const SizedBox(height: 15),
              const TextfieldWidget(
                label: "Email",
                hintText: "Email",
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 15),
              const TextfieldWidget(
                label: "Phone No",
                hintText: "Phone Number",
                prefixIcon: Icons.phone,
              ),
              const SizedBox(height: 15),
              const TextfieldWidget(
                label: "Password",
                hintText: "********",
                prefixIcon: Icons.fingerprint,
                suffixIcon: Icons.remove_red_eye,
              ),
              const SizedBox(height: 30),
              ElevatedButtonWidget(
                text: "Edit Profile",
                onPressed: () {},
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 16),
                      children: [
                        TextSpan(text: "Joinded"),
                        WidgetSpan(
                            child: SizedBox(
                          width: 10,
                        )),
                        TextSpan(
                          text: "03 May 2024",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Delete",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
