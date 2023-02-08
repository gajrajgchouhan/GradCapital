import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gc_frontend/db.dart';
import 'package:gc_frontend/screens/ledger/payment/model.dart';
import 'package:gc_frontend/screens/ledger/group/member.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class TranscationAdaptor extends PreferenceAdapter<List<dynamic>> {
  @override
  getValue(SharedPreferences preferences, String key) {
    var v = preferences.get(key);
    if (v == null) {
      return null;
    }
    print(["vvvvvvvvv", v, v.runtimeType]);
    var js = json.decode(v as String);
    print("jssssssssssssss");
    if (js == null) {
      return null;
    } else {
      return js as List<dynamic>;
    }
  }

  @override
  Future<bool> setValue(SharedPreferences preferences, String key, value) {
    return preferences.setString(key, json.encode(value));
  }
}
class MemberAdaptor extends PreferenceAdapter<List<dynamic>> {
  @override
  getValue(SharedPreferences preferences, String key) {
    var v = preferences.get(key);
    if (v == null) {
      return null;
    }
    print(["vvvvvvvvv", v, v.runtimeType]);
    var js = json.decode(v as String);
    print("jssssssssssssss");
    if (js == null) {
      return null;
    } else {
      return js as List<dynamic>;
    }
  }

  @override
  Future<bool> setValue(SharedPreferences preferences, String key, value) {
    return preferences.setString(key, json.encode(value));
  }
}
class AppSettings extends InheritedWidget {
  final Preference<List<dynamic>> transcations;
  final Preference<List<dynamic>> members;

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
         members=   preferences.getCustomValue('members',
            defaultValue: [], adapter: MemberAdaptor()),
        super(child: child);

  // add transcation
  Future<bool> addTranscation(Model model) {
    Map m = {
      "title": model.title,
      "uploader": model.uploader,
      "vendor": model.vendor,
      "payMethod": model.payMethod,
      "debit": model.debit,
      "gstNo": model.gstNo,
      "gstAmt": model.gstAmt,
    };

    return transcations.setValue([...transcations.getValue(), m]);
  }
    // add member
  Future<bool> addMember(Member member) {
    Map m = {
      "name": member.name,
    };

    return members.setValue([...members.getValue(), m]);
  }
}
