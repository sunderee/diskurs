import 'dart:convert';

import 'package:flutter/services.dart';

Future<String> loadBaseApiUrl() async {
  String data = await rootBundle.loadString('assets/config.dev.json');
  return jsonDecode(data)['base_api_url'] as String;
}

Future<String> loadCorpusApiUrl() async {
  String data = await rootBundle.loadString('assets/config.dev.json');
  return jsonDecode(data)['corpus_api_url'] as String;
}
