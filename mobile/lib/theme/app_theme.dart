import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    const primaryColor = Colors.deepPurple;
    const accentColor = Colors.deepPurpleAccent;
    const backgroundColor = Colors.white;
    const buttonTextColor = Colors.white;
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: accentColor,
        surface: backgroundColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: primaryColor,
            foregroundColor: buttonTextColor),
      ),
      iconTheme: const IconThemeData(color: primaryColor),
    );
  }
}
