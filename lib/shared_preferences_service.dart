import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String KEY_USERNAME = 'username';

  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_USERNAME);
  }

  Future<void> setUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(KEY_USERNAME, username);
  }
}
