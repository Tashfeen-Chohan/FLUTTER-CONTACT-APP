import 'package:flutter/material.dart';
import 'package:login_app/src/constants/image_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Image.asset(
              tGoogleLogo,
              width: 30,
            ),
            label: const Text(
              "Sign-In with Google",
              style: TextStyle(color: Colors.black),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {},
          child: const Text.rich(
            TextSpan(
              style: TextStyle(color: Colors.black),
              text: "Don't have an account?",
              children: [
                TextSpan(
                    text: "Signup",
                    style: TextStyle(
                      color: Colors.blue,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
