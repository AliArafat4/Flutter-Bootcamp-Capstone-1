import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/theme_bloc/them_.state.dart';
import 'package:team_hack/bloc/theme_bloc/them_event.dart';
import 'package:team_hack/local_storage/shared_prefrences.dart';
import 'package:team_hack/theme/app_theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(GetThemeState(themeData: appThemeMap[getCurrentTheme()])) {
    on<ChangeThemeEvent>((event, emit) {
      setTheme(event.themeText);
      emit(GetThemeState(themeData: appThemeMap[event.themeText]));
    });

    on<GetThemeEvent>(
      (event, emit) async {
        final currentThemeText = await getCurrentTheme();
        emit(GetThemeState(themeData: appThemeMap[currentThemeText]));
      },
    );
  }
}
