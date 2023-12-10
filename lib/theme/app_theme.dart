import 'package:flutter/material.dart';

final Map appThemeMap = {
  "light": ThemeData(
    scaffoldBackgroundColor: const Color(0xffF7F7F7),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.resolveWith<Color>(
            (states) => Colors.black.withOpacity(0.6)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xff62c1c7),
      ),
    ),
    iconTheme: const IconThemeData(color: Color(0xff695678), size: 20),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff62c1c7),
        elevation: 0,
      ),
    ),
    colorScheme: ColorScheme.light(
        secondary: Colors.white, onPrimary: Colors.black.withOpacity(0.5)),
    primaryTextTheme: TextTheme(
      titleSmall: TextStyle(color: Colors.black.withOpacity(0.6)),
    ),
  ),
  "dark": ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        secondary: const Color(0xff62c1c7).withOpacity(0.1),
        onPrimary: Colors.grey),
    appBarTheme:
        const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xff62c1c7),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff62c1c7),
        elevation: 0,
      ),
    ),
  ),
};
