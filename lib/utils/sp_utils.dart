import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  SPUtils._privateConstructor();
  static final SPUtils _instance = SPUtils._privateConstructor();
  static SPUtils get instance => _instance;
  SharedPreferences? _prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveData(String key, value) async {
    if (_prefs == null) return;
    if (value is String) {
      _prefs?.setString(key, value);
    } else if (value is num) {
      _prefs?.setInt(key, value as int);
    } else if (value is double) {
      _prefs?.setDouble(key, value);
    } else if (value is bool) {
      _prefs?.setBool(key, value);
    } else if (value is List) {
      _prefs?.setStringList(key, value.cast<String>());
    }
  }

  Future<dynamic> getData(String key, [replace]) async {
    if (_prefs == null) return;
    dynamic data = _prefs?.get(key);
    if (data != null) {
      return data;
    } else {
      return replace;
    }
  }

  Future<void> removeData(String key) async {
    _prefs?.remove(key);
  }

  Future<void> removeDataAll() async {
    _prefs?.clear();
  }
}
