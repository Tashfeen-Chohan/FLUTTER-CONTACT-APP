import 'package:flutter/material.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/common/textfield_widget.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const TextfieldWidget(
            label: "Username",
            hintText: "Full Name",
            prefixIcon: Icons.verified_user_outlined,
          ),
          const SizedBox(
            height: 10,
          ),
          const TextfieldWidget(
            label: "Email",
            hintText: "E-Mail",
            prefixIcon: Icons.email_outlined,
          ),
          const SizedBox(
            height: 10,
          ),
          const TextfieldWidget(
            label: "Phone No",
            hintText: "Phone No",
            prefixIcon: Icons.numbers,
          ),
          const SizedBox(
            height: 10,
          ),
          const TextfieldWidget(
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
            onPressed: () {},
          ),
        ],
      ),
    ));
  }
}
