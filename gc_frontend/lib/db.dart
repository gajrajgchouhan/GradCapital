import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<bool> saveData(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  bool res = await prefs.setString(key, value);
  return res;
}

Future<String?> getData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future<List<dynamic>> getArray(String key) async {
  var res = (await getData(key));
  if (res != null) {
    res = json.decode(res);
    return res as List<dynamic>;
  } else {
    return [];
  }
}

Future<bool> addArray(String key, Map value) async {
  var existing = await getArray(key);
  existing.add(value);
  var f = json.encode(existing);
  return await saveData(key, f);
}
