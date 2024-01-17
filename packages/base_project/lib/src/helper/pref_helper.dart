import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static  SharedPreferences? _preferences;

  static bool _initCalled = false;

  static void init() async {
    _initCalled = true;
    _preferences = await _prefs;
  }

  static void dispose() {
    // _prefs = null;
    // _preferences = null;
  }

  ////return all keys in the persistent storage
  static Set<String> getKeys() {
    assert(_initCalled, "Prefs.init() must be called first in an initState() preferably !");
    assert(_preferences != null, "May be call Prefs.getKeyF() instead, Sharepreferences not ready yet");
    return _preferences!.getKeys();
  }

  static Future<Set<String>> getKeyF() async {
    Set<String> values;
    if (_preferences == null) {
      var instance = await _prefs;
      values = instance.getKeys();
    } else {
      values = getKeys();
    }
    return values;
  }

  static dynamic get(String key) {
    assert(_initCalled, "Prefs.init() must be called first in an initState() preferably !");
    assert(_preferences != null, "May be call Prefs.getF() instead, Sharepreferences not ready yet");
    return _preferences!.get(key);
  }

  static Future<dynamic> getF(String key) async {
    dynamic value;
    if (_preferences == null) {
      var instance = await _prefs;
      value = instance.get(key);
    } else {
      value = get(key);
    }
    return value;
  }

  static bool getBool(String key) {
    assert(_initCalled, "Prefs.init() must be called first in an initState() preferably !");
    assert(_preferences != null, "May be call Prefs.getBoolF() instead, Sharepreferences not ready yet");
    return _preferences!.getBool(key) ?? false;
  }

  static Future<bool> getBoolF(String key) async {
    bool value;
    if (_preferences == null) {
      var instance = await _prefs;
      value = instance.getBool(key) ?? false;
    } else {
      value = getBool(key);
    }
    return value;
  }

  static int getInt(String key) {
    assert(_initCalled, "Prefs.init() must be called first in an initState() preferably !");
    assert(_preferences != null, "May be call Prefs.getIntF() instead, Sharepreferences not ready yet");
    return _preferences!.getInt(key) ?? 0;
  }

  static Future<int> getIntF(String key) async {
    int value;
    if (_preferences == null) {
      var instance = await _prefs;
      value = instance.getInt(key) ?? 0;
    } else {
      value = getInt(key);
    }
    return value;
  }

  static double getDouble(String key) {
    assert(_initCalled, "Prefs.init() must be called first in an initState() preferably !");
    assert(_preferences != null, "May be call Prefs.getDoubleF() instead, Sharepreferences not ready yet");
    return _preferences!.getDouble(key) ?? 0;
  }

  static Future<double> getDoubleF(String key) async {
    double value;
    if (_preferences == null) {
      var instance = await _prefs;
      value = instance.getDouble(key) ?? 0;
    } else {
      value = getDouble(key);
    }
    return value;
  }

  static String getString(String key) {
    assert(_initCalled, "Prefs.init() must be called first in an initState() preferably !");
    assert(_preferences != null, "May be call Prefs.getStringF() instead, Sharepreferences not ready yet");
    return _preferences!.getString(key) ?? "";
  }

  static Future<String> getStringF(String key) async {
    String value;
    if (_preferences == null) {
      var instance = await _prefs;
      value = instance.getString(key) ?? "";
    } else {
      value = getString(key);
    }
    return value;
  }

  static List<String> getStringList(String key) {
    assert(_initCalled, "Prefs.init() must be called first in an initState() preferably !");
    assert(_preferences != null, "May be call Prefs.getStringListF() instead, Sharepreferences not ready yet");
    return _preferences!.getStringList(key) ?? [""];
  }

  static Future<List<String>> getStringListF(String key) async {
    List<String> value;
    if (_preferences == null) {
      var instance = await _prefs;
      value = instance.getStringList(key) ?? [""];
    } else {
      value = getStringList(key);
    }
    return value;
  }

  static Future<bool> setBool(String key, bool value) async {
    var instance = await _prefs;
    return instance.setBool(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    var instance = await _prefs;
    return instance.setInt(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    var instance = await _prefs;
    return instance.setDouble(key, value);
  }

  static Future<bool> setString(String key, String value) async {
    var instance = await _prefs;
    return instance.setString(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    var instance = await _prefs;
    return instance.setStringList(key, value);
  }

  static Future<bool> remove(String key) async {
    var instance = await _prefs;
    return instance.remove(key);
  }

  static Future<bool> clear() async {
    var instance = await _prefs;
    return instance.clear();
  }
}
