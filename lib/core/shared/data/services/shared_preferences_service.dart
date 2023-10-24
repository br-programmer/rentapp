import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setString({required String key, required String value}) {
    return _preferences.setString(key, value);
  }

  String? getString({required String key}) {
    return _preferences.getString(key);
  }

  Future<void> setBool({required String key, required bool value}) {
    return _preferences.setBool(key, value);
  }

  bool? getBool({required String key}) => _preferences.getBool(key);

  Future<void> setInt({required String key, required int value}) {
    return _preferences.setInt(key, value);
  }

  int? getInt({required String key}) => _preferences.getInt(key);

  Future<void> setDouble({required String key, required double value}) {
    return _preferences.setDouble(key, value);
  }

  double? getDouble({required String key}) {
    return _preferences.getDouble(key);
  }

  List<String> getStringList({required String key}) {
    return _preferences.getStringList(key) ?? [];
  }

  Future<void> setStringList({
    required String key,
    required List<String> value,
  }) {
    return _preferences.setStringList(key, value);
  }

  Future<void> remove(String key) => _preferences.remove(key);
}
