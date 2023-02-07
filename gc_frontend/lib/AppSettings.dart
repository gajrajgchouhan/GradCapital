import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gc_frontend/db.dart';
import 'package:gc_frontend/screens/ledger/payment/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class TranscationAdaptor extends PreferenceAdapter<List<Model>> {
  @override
  getValue(SharedPreferences preferences, String key) {
    return json.decode(preferences.get(key).toString()) as List<Model>;
  }

  @override
  Future<bool> setValue(SharedPreferences preferences, String key, value) {
    return preferences.setString(key, value.toString());
  }
}

class AppSettings extends InheritedWidget {
  final Preference<List<Model>> transcations;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AppSettings of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<AppSettings>())!;

  AppSettings(
      {super.key,
      required Widget child,
      required StreamingSharedPreferences preferences})
      : transcations = preferences.getCustomValue('transcations',
            defaultValue: [], adapter: TranscationAdaptor()),
        super(child: child);

  // add transcation
  Future<bool> addTranscation(Model model) {
    return transcations.setValue([...transcations.getValue(), model]);
  }
}
