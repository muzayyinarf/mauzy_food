import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionPreference {
  static const String _subsicriptionKey = 'subscription';

  Future<bool> getSubscription() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_subsicriptionKey) ?? false;
  }

  Future<void> setSubscription(bool darkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_subsicriptionKey, darkMode);
  }
}
