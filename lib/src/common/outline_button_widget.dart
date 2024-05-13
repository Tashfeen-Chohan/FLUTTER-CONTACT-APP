import 'package:flutter/material.dart';

class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget({
    super.key,
    this.color = Colors.black,
    required this.text,
    this.width = double.infinity,
    this.onPressed,
  });

  final Color color;
  final String text;
  final double width;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20),
          elevation: 0,
          side: const BorderSide(color: Colors.blue),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
