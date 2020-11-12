import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:gestao_usuario/app/domain/models/user.dart';
import 'package:gestao_usuario/app/utils/const.dart';

// import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // region UserData
  static saveUserData(User userModel) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    //  _sp.setString(kUserSharedPreferencesKey, json.encode(userModel?.toJson()));
  }

//ForStore User from api
  static Future<User> getUserData() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    User userData;

    final userDataStr = _sp.getString(kUserSharedPreferencesKey);

    if (userDataStr != null) {
      print("userDataStr");
      print(userDataStr);
      final convertedUserData = jsonDecode(userDataStr);
      // userData = User.fromJson(convertedUserData);
    }

    return userData;
  }

  static removeUserData() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    _sp.remove(kUserSharedPreferencesKey);
  }
  // endregion

  // region Settings
  static saveAppSettings(
      BuildContext context, Map<String, dynamic> settings) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    _sp.setString("settings", json.encode(settings));
  }

  /*static Future<void> setUpAppSettings() async {
    final settingsProvider = Provider.of<AppSettingsModel>(locator<NavigationService>().context, listen: false);

    SharedPreferences _sp = await SharedPreferences.getInstance();
    var settingsStr = _sp.getString("settings");

    if (settingsStr == null) {
      final settings = settingsProvider.baseSettings;
      _sp.setString("settings", json.encode(settings));

      settingsProvider.settings = settings;
    } else {
      settingsProvider.settings = json.decode(settingsStr);
    }
  }*/

  /*
  static Future<Map<String, dynamic>> getAppSettings() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    var settingString = _sp.getString("settings");

    if (settingString != null) {
      return json.decode(settingString);
    } else {
      final settings = Provider.of<AppSettingsModel>(locator<NavigationService>().context, listen: false).settings;

      _sp.setString("settings", json.encode(settings));
    }
    return null;
  }
*/
  static removeAppSettings(BuildContext context) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    _sp.remove("settings");
  }
  // endregion

  // region Other
  static saveJson(String key, Map<String, dynamic> data) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    _sp.setString(key, json.encode(data));
  }

  static Future<Map<String, dynamic>> getJson(String key) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    final jsonStr = _sp.getString(key);
    if (jsonStr != null) {
      return json.decode(jsonStr);
    }
    return null;
  }
// endregion
}
