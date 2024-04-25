import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
  });

  final String label, hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(label.toUpperCase()),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        suffix: suffixIcon != null ? Icon(suffixIcon) : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
