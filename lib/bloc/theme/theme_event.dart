part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.toogleTheme(bool value) = _ToogleTheme;
  const factory ThemeEvent.getTheme() = _GetTheme;
}
