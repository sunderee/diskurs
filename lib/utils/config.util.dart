import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Future<String> loadBaseApiUrl() async {
  String data = await rootBundle.loadString('assets/config.dev.json');
  return jsonDecode(data)['base_api_url'] as String;
}
