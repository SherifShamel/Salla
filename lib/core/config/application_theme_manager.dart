import 'package:flutter/material.dart';
import 'package:salla/main.dart';

class ApplicationThemeManager {
  static var mediaQuery =
      MediaQuery.of(navigatorKey.currentState!.context).size;
  static ThemeData themeData = ThemeData(
    primaryColor: const Color(0xFF004182),
  );
}
