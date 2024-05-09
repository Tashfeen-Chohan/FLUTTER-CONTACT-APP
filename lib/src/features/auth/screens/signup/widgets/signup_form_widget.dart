// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/common/textfield_widget.dart';
import 'package:login_app/src/features/auth/controllers/signup_controller.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';
import 'package:login_app/src/features/auth/screens/forget_password/forget_password_otp/otp_screen.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            TextfieldWidget(
              controller: signupController.fullName,
              label: "Username",
              hintText: "Full Name",
              prefixIcon: Icons.verified_user_outlined,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your usernname!";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextfieldWidget(
              controller: signupController.email,
              label: "Email",
              hintText: "E-Mail",
              prefixIcon: Icons.email_outlined,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email address!";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextfieldWidget(
              isPassword: true,
              controller: signupController.password,
              label: "Password",
              hintText: "********",
              prefixIcon: Icons.fingerprint,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password!";
                } else if (value.length < 6) {
                  return "Password must be at least 6 characters long";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButtonWidget(
              text: "SIGNUP",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final user = UserModel(
                    fullName: signupController.fullName.text.trim(),
                    email: signupController.email.text.trim(),
                    password: signupController.password.text.trim(),
                    timestamp: Timestamp.now()
                  );
                  signupController.createUser(user);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
