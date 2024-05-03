import 'package:flutter/material.dart';
import 'package:login_app/src/features/auth/screens/login/login_screen.dart';
import 'package:login_app/src/features/auth/screens/signup/signup_screen.dart';

class WelcomeButtonsWidget extends StatelessWidget {
  const WelcomeButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void navigateToLogin() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }

    void navigateToSingupScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );
    }

    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: navigateToSingupScreen,
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: const StadiumBorder(),
                side: const BorderSide(color: Colors.black),
                foregroundColor: Colors.black),
            child: const Text(
              "SIGNUP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: navigateToLogin,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10),
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
            ),
            child: const Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        )
      ],
    );
  }
}
