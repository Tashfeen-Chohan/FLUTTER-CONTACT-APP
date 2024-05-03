import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/common/textfield_widget.dart';

class UpdateProfileForm extends StatelessWidget {
  const UpdateProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
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
            onPressed: () {
              Get.snackbar("Hello", "Tashfeen Chohan");
            },
          ),
        ],
      ),
    );
  }
}
