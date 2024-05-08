import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/common/textfield_widget.dart';
import 'package:login_app/src/features/auth/controllers/login_controller.dart';
import 'package:login_app/src/features/auth/screens/forget_password/forget_password_options/forget_password_bottom_sheet.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            TextfieldWidget(
              controller: loginController.email,
              label: "EMAIL",
              hintText: "Your Email",
              prefixIcon: Icons.email_outlined,
            ),
            const SizedBox(
              height: 15,
            ),
            TextfieldWidget(
              isPassword: true,
              controller: loginController.password,
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
              onPressed: () => _handleLogin(
                loginController.email.text.trim(),
                loginController.password.text.trim(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleLogin(String email, String password) {
    LoginController.instance.loginUser(email, password);
  }
}
