import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
  });

  final Color backgroundColor, foregroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          padding: const EdgeInsets.symmetric(vertical: 20),
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        child: Text(text),
      ),
    );
  }
}
