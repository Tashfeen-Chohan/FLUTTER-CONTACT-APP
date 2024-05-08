// ignore_for_file: unused_import

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
              ),
              const SizedBox(
                height: 15,
              ),
              TextfieldWidget(
                controller: signupController.email,
                label: "Email",
                hintText: "E-Mail",
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(
                height: 15,
              ),
              TextfieldWidget(
                controller: signupController.password,
                label: "Password",
                hintText: "********",
                prefixIcon: Icons.fingerprint,
                suffixIcon: Icons.remove_red_eye,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButtonWidget(
                text: "SIGNUP",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // FOR EMAIL & PASSWORD
                    // signupController.registerUser(
                    //   signupController.email.text.trim(),
                    //   signupController.password.text.trim(),
                    // )

                    // FOR PHONE AUTHENTICATION
                    // signupController.phoneAuthentication(
                    //   signupController.phoneNo.text.trim(),
                    // ),
                    // Get.to(() => const OtpScreen())

                    final user = UserModel(
                      fullName: signupController.fullName.text.trim(),
                      email: signupController.email.text.trim(),
                      password: signupController.password.text.trim(),
                    );
                    signupController.createUser(user);
                  }
                },
              ),
            ],
          ),
        ));
  }
}
