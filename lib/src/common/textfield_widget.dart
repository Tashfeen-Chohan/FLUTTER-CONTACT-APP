import 'package:flutter/material.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.initialValue,
    this.isPassword = false,
  });

  final String label, hintText;
  final String? initialValue;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final bool isPassword;

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? _obscureText : false,
      initialValue: widget.initialValue,
      controller: widget.controller,
      decoration: InputDecoration(
        label: Text(widget.label.toUpperCase()),
        hintText: widget.hintText,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
