import 'package:flutter/material.dart';
import 'package:login_app/src/common/outline_icon_button_widget.dart';
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
        const OutLineIconButtonWidget(),
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
