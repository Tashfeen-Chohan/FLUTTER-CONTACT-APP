import 'package:flutter/material.dart';
import 'package:login_app/src/features/auth/screens/login/login_footer_widget.dart';
import 'package:login_app/src/features/auth/screens/login/login_form_widget.dart';
import 'package:login_app/src/features/auth/screens/login/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              LoginHeaderWidget(height: height),
              const LoginFormWidget(),
              const LoginFooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
