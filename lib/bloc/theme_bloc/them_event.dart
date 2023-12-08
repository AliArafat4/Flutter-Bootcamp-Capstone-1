abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final String themeText;

  ChangeThemeEvent({required this.themeText});
}

class GetThemeEvent extends ThemeEvent {}
