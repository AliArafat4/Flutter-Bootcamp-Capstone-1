import 'package:flutter/material.dart';

abstract class ThemeState {}

final class GetThemeState extends ThemeState {
  final ThemeData themeData;

  GetThemeState({required this.themeData});
}
