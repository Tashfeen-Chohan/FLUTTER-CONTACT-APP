import 'package:flutter/material.dart';
import 'package:login_app/src/common/outline_icon_button_widget.dart';
import 'package:login_app/src/features/auth/screens/login/login_screen.dart';

class SignupFooterWidget extends StatelessWidget {
  const SignupFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void navigateToLoginScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
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
          onPressed: navigateToLoginScreen,
          child: const Text.rich(
            TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(text: "Already have an account?"),
                WidgetSpan(child: SizedBox(width: 5)),
                TextSpan(
                  text: "LOGIN",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
