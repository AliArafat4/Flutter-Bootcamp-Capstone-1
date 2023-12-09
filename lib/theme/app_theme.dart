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
    iconTheme: const IconThemeData(color: Color(0xff695678)),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Color(0xffF7F7F7),
    ),
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff62c1c7),
        elevation: 0,
      ),
    ),
    colorScheme: const ColorScheme.light(
      secondary: Colors.white,
      onPrimary: Colors.black,
    ),
    primaryTextTheme: TextTheme(
      titleSmall: TextStyle(color: Colors.black.withOpacity(0.6)),
    ),
  ),
  "dark": ThemeData(
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStateProperty.resolveWith<Color>(
              (states) => Colors.black.withOpacity(0.6)),
        ),
      ),
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        secondary: const Color(0xff62c1c7).withOpacity(0.1),
      ),
      //textTheme: TextTheme()
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xff62c1c7),
        ),
      ),
      iconTheme: const IconThemeData(color: Color(0xff695678)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff62c1c7),
          elevation: 0,
        ),
      ),
      textTheme: const TextTheme()),
};
