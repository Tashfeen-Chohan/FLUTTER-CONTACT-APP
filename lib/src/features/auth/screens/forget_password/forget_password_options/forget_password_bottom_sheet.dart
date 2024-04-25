import 'package:flutter/material.dart';
import 'package:login_app/src/features/auth/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';

class ForgetPasswordScreen{
  static Future<dynamic> showModelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                "Make Selection",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Select one of the options give below to reset your password.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 30,
              ),
              ForgetPasswordBtnWidget(
                icon: Icons.email_outlined,
                title: "E-Main",
                subtile: "Reset via E-Mail verification",
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ForgetPasswordBtnWidget(
                icon: Icons.mobile_friendly_rounded,
                title: "Phone",
                subtile: "Reset via Phone verification",
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }

}