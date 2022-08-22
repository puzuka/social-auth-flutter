import 'package:shared_preferences/shared_preferences.dart';

const _defaultLanguage = 'en';

const _keySaveLanguage = '_keySaveLanguage';

class AppSettingUseCase {
  final SharedPreferences _sharedPreferences;

  AppSettingUseCase(this._sharedPreferences);

  Future<bool> saveLanguage(String language) async {
    return _sharedPreferences.setString(_keySaveLanguage, language);
  }

  String getLanguage() =>
      _sharedPreferences.getString(_keySaveLanguage) ?? _defaultLanguage;
}
