import 'package:shared_preferences/shared_preferences.dart';

class DarkModePreference {
  static const String _darkModeKey = 'darkMode';

  Future<bool> getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_darkModeKey) ?? false;
  }

  Future<void> setDarkMode(bool darkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_darkModeKey, darkMode);
  }
}
