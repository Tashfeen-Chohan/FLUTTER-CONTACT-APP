import 'package:flutter/material.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/common/form_header_widget.dart';
import 'package:login_app/src/common/textfield_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/auth/screens/forget_password/forget_password_otp/otp_screen.dart';

class ForgetPasswordMail extends StatelessWidget {
  const ForgetPasswordMail({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToOtpScreen() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const OtpScreen();
      }));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const FormHeaderWidget(
                headerImg: tOnBoardingImg1,
                title: "Forget Password",
                subTitle: "Enter E-Mail address associated with your account.",
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Form(
                  child: Column(
                    children: [
                      TextfieldWidget(
                        label: "E-MAIL",
                        hintText: "Your Email",
                        prefixIcon: Icons.email_outlined,
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButtonWidget(
                text: "Next",
                onPressed: navigateToOtpScreen,
              )
            ],
          ),
        ),
      ),
    );
  }
}
