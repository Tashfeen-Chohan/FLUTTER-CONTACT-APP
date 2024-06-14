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
          "Personal Contact Hub",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const Text(
          "Manage and Access Contacts Anytime, Anywhere",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
