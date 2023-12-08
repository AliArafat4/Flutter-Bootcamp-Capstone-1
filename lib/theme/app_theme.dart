import 'package:flutter/material.dart';

final Map appThemeMap = {
  "light": ThemeData(
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:
          ElevatedButton.styleFrom(backgroundColor: const Color(0xfffffffff)),
    ),
  ),
  "dark": ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:
          ElevatedButton.styleFrom(backgroundColor: const Color(0xfffffffff)),
    ),
  ),
};
