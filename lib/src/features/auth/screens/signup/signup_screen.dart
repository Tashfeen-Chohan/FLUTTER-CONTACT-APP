import 'package:flutter/material.dart';
import 'package:login_app/src/features/auth/screens/signup/widgets/signup_footer_widget.dart';
import 'package:login_app/src/features/auth/screens/signup/widgets/signup_form_widget.dart';
import 'package:login_app/src/features/auth/screens/signup/widgets/signup_header_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SignupHeaderWidget(height: height),
              const SignupFormWidget(),
              const SignupFooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
