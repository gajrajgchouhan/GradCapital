import 'dart:convert';

import 'package:flutter/services.dart';

Future<dynamic> readJson(String path) async {
  final String response = await rootBundle.loadString(path);
  final data = await json.decode(response);
  return data;
}
