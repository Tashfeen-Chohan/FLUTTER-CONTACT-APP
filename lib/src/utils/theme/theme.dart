import 'package:flutter/material.dart';

class MyAppTheme {
  // PRIVATE CONSTRUCTOR : It's instance can't be created;
  MyAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: Colors.black87),
    ),
  );
  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
