import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mauzy_food/utils/dark_mode_preference.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  late DarkModePreference darkModePreference;
  ThemeBloc(this.darkModePreference) : super(const _ThemeState()) {
    on<_ToogleTheme>((event, emit) async {
      final bool darkMode = (event.value);
      await darkModePreference.setDarkMode(darkMode);
      emit(state.copyWith(isDarkmode: darkMode));
    });
    on<_GetTheme>((event, emit) async {
      final darkMode = await darkModePreference.getDarkMode();
      emit(state.copyWith(isDarkmode: darkMode));
    });
  }
}
