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
            defaultValue: [
              {
                "title": "Soft Drinks",
                "uploader": "Vatsal Hooda",
                "vendor": "Monal Canteen",
                "payMethod": "Cash",
                "debit": "5,500",
                "gstNo": "",
                "gstAmt": "",
                "date": "02 Feb",
                "flags": 12,
                "img": "assets/images/a.png",
              },
              {
                "title": "DJ Remaining",
                "uploader": "",
                "vendor": "Samiksha Bhagat",
                "payMethod": "",
                "debit": "30,000",
                "gstNo": "",
                "gstAmt": "",
                "date": "01 Feb",
                "flags": 3,
                "img": "assets/images/b.png",
              },
              {
                "title": "Decoration",
                "uploader": "",
                "vendor": "Kanika Traders",
                "payMethod": "",
                "debit": "12,500",
                "gstNo": "",
                "gstAmt": "",
                "date": "27 Jan",
                "flags": 0,
                "img": "assets/images/c.png",
              },
              // {
              //   "title": "Snacks",
              //   "uploader": "",
              //   "vendor": "Tragopan",
              //   "payMethod": "",
              //   "debit": "6,700",
              //   "gstNo": "",
              //   "gstAmt": "",
              //   "date": "25 Jan",
              //   "flags": 17,
              //   "img": "restaurant",
              // }
            ],
            adapter: TranscationAdaptor()),
        members = preferences.getCustomValue('members',
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
      "bill": model.bill,
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
