import 'package:flutter/material.dart';
import 'package:login_app/src/constants/image_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage(tWelomeScreenImg),
          height: height * 0.2,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Welcome Back",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          "Make it work, make it right, make it fact.",
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
