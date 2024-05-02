import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    this.backgroundColor = Colors.black,
    this.foregroundColor = Colors.white,
    required this.text,
    this.width = double.infinity,
    this.onPressed,
  });

  final Color? backgroundColor, foregroundColor;
  final String text;
  final double width;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          padding: const EdgeInsets.symmetric(vertical: 20),
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
