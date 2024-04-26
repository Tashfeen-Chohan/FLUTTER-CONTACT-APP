import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hey, Welcome Tashfeen Chohan!",
          style: textTheme.bodyMedium,
        ),
        Text(
          "Explore Courses!",
          style: textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
