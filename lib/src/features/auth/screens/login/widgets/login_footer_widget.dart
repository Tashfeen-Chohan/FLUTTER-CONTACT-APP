import 'package:flutter/material.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/auth/screens/signup/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void navigateToSignupScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        ),
      );
    }

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
          onPressed: navigateToSignupScreen,
          child: const Text.rich(
            TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "Don't have an account?",
                ),
                WidgetSpan(child: SizedBox(width: 5)),
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
