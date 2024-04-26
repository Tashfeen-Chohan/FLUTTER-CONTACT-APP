import 'package:flutter/material.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/common/textfield_widget.dart';
import 'package:login_app/src/features/auth/screens/forget_password/forget_password_options/forget_password_bottom_sheet.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const TextfieldWidget(
              label: "EMAIL",
              hintText: "Your Email",
              prefixIcon: Icons.email_outlined,
            ),
            const SizedBox(
              height: 15,
            ),
            const TextfieldWidget(
              label: "PASSWORD",
              hintText: "********",
              prefixIcon: Icons.fingerprint,
              suffixIcon: Icons.remove_red_eye,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text("Forget Password?"),
                onPressed: () {
                  ForgetPasswordScreen.showModelBottomSheet(context);
                },
              ),
            ),
            ElevatedButtonWidget(
              text: "LOGIN",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
