import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStorage {
  SharedPrefsStorage();

  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    // await _prefs.clear();
  }

  Future<T?> get<T>(String key) async {
    Object? value;

    if (sameTypes<T, List<String>>()) {
      value = _prefs.getStringList(key);
    } else {
      value = _prefs.get(key);
    }

    return value as T;
  }

  Future<bool> set<T>(String key, T value) async {
    if (sameTypes<T, bool>()) {
      return await _prefs.setBool(key, value as bool);
    }

    if (sameTypes<T, int>()) {
      return await _prefs.setInt(key, value as int);
    }

    if (sameTypes<T, double>()) {
      return await _prefs.setDouble(key, value as double);
    }

    if (sameTypes<T, String>()) {
      return await _prefs.setString(key, value as String);
    }

    if (sameTypes<T, List<String>>()) {
      return await _prefs.setStringList(key, value as List<String>);
    }

    if (value is Enum) {
      return await _prefs.setInt(key, value.index);
    }

    return false;
  }

  Future<bool> delete<T>(String key) async {
    return await _prefs.remove(key);
  }
}

bool sameTypes<S, V>() {
  void func<X extends S>() {}
  return func is void Function<X extends V>();
}
