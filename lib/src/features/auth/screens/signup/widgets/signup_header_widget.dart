import 'package:flutter/material.dart';
import 'package:login_app/src/constants/image_strings.dart';

class SignupHeaderWidget extends StatelessWidget {
  const SignupHeaderWidget({
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
          image: const AssetImage(tSignupImg),
          height: height * 0.2,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Get on Board!",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          "Create your profile to start your Journey.",
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
