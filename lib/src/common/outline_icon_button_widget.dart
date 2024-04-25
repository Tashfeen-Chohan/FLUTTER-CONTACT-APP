import 'package:flutter/material.dart';
import 'package:login_app/src/constants/image_strings.dart';

class OutLineIconButtonWidget extends StatelessWidget {
  const OutLineIconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Image.asset(
          tGoogleLogo,
          width: 30,
        ),
        label: const Text(
          "Sign-In with Google",
          style: TextStyle(color: Colors.black),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
