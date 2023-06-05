import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightThemeData => ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
      );

  static ThemeData get darkThemeData => ThemeData(
      fontFamily: 'Roboto',
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: const Color(0xFF1B1E1E),
      brightness: Brightness.dark);
}
