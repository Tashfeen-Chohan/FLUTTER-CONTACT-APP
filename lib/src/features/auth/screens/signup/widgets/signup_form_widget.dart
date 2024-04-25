import 'package:flutter/material.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/common/textfield_widget.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Form(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          TextfieldWidget(
            label: "Username",
            hintText: "Full Name",
            prefixIcon: Icons.verified_user_outlined,
          ),
          SizedBox(
            height: 10,
          ),
          TextfieldWidget(
            label: "Email",
            hintText: "E-Mail",
            prefixIcon: Icons.email_outlined,
          ),
          SizedBox(
            height: 10,
          ),
          TextfieldWidget(
            label: "Phone No",
            hintText: "Phone No",
            prefixIcon: Icons.numbers,
          ),
          SizedBox(
            height: 10,
          ),
          TextfieldWidget(
            label: "Password",
            hintText: "********",
            prefixIcon: Icons.fingerprint,
            suffixIcon: Icons.remove_red_eye,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButtonWidget(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            text: "SIGNUP",
          ),
        ],
      ),
    ));
  }
}
