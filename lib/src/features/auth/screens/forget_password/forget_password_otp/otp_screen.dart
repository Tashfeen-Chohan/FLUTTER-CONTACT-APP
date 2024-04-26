// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Text(
                "OTP",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                ),
              ),
              const Text(
                "Verification",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "Enter the verification code we just sent you on your E-Mail address",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) => print("OTP code is $code"),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButtonWidget(
                text: "Next",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
