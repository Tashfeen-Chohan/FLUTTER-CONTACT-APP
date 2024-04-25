import 'package:flutter/material.dart';
import 'package:login_app/src/features/auth/screens/signup/widgets/signup_textfield_widget.dart';

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
          const SignupTextfieldWidget(
            label: "Username",
            hintText: "Full Name",
            prefixIcon: Icons.verified_user_rounded,
          ),
          const SizedBox(
            height: 10,
          ),
          const SignupTextfieldWidget(
            label: "Email",
            hintText: "E-Mail",
            prefixIcon: Icons.email,
          ),
          const SizedBox(
            height: 10,
          ),
          const SignupTextfieldWidget(
            label: "Phone No",
            hintText: "Phone No",
            prefixIcon: Icons.numbers,
          ),
          const SizedBox(
            height: 10,
          ),
          const SignupTextfieldWidget(
            label: "Password",
            hintText: "********",
            prefixIcon: Icons.fingerprint,
            suffixIcon: Icons.remove_red_eye,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              child: const Text("SIGNUP"),
            ),
          )
        ],
      ),
    ));
  }
}
