import 'package:flutter/material.dart';
import 'package:login_app/src/common/form_header_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/auth/screens/signup/widgets/signup_footer_widget.dart';
import 'package:login_app/src/features/auth/screens/signup/widgets/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: const Column(
            children: [
              FormHeaderWidget(
                headerImg: tSignupImg,
                title: "Get on Board!",
                subTitle: "Create your profile to start your Journey.",
              ),
              SignupFormWidget(),
              SignupFooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
