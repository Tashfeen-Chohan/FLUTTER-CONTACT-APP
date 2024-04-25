import 'package:flutter/material.dart';
import 'package:login_app/src/common/form_header_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/auth/screens/login/widgets/login_footer_widget.dart';
import 'package:login_app/src/features/auth/screens/login/widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: const Column(
            children: [
              FormHeaderWidget(
                headerImg: tWelomeScreenImg,
                title: "Welcome Back!",
                subTitle: "Make it work, make it right, make it fact.",
              ),
              LoginFormWidget(),
              LoginFooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
