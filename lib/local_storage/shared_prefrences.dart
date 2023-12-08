import 'package:team_hack/main.dart';

getCurrentTheme() {
  return prefs.getString("theme") ?? "light";
}

setTheme(String themeText) {
  prefs.setString("theme", themeText);
}
