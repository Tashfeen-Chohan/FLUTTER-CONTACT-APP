import 'package:flutter/material.dart';

class WelcomeIntroWidget extends StatelessWidget {
  const WelcomeIntroWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Build Awesome Apps",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const Text(
          "Lets put your creativity on the development highway",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
