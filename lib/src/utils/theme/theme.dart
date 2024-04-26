import 'package:flutter/material.dart';

class MyAppTheme {
  // PRIVATE CONSTRUCTOR : It's instance can't be created;
  MyAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
