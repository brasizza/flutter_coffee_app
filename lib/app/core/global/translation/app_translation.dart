import 'dart:convert';

import 'package:flutter/services.dart';

class AppTranslation {
  Map<String, String> ptKeys = {};
  Map<String, String> enKeys = {};
  Map<String, String> esKeys = {};
  String currentLocale = '';
  init() async {
    ptKeys = Map<String, String>.from(jsonDecode(await rootBundle.loadString('assets/locales/pt.json')));
    enKeys = Map<String, String>.from(jsonDecode(await rootBundle.loadString('assets/locales/en.json')));
    esKeys = Map<String, String>.from(jsonDecode(await rootBundle.loadString('assets/locales/es.json')));
    return this;
  }

  Map<String, Map<String, String>> get keys => {
        'pt': ptKeys,
        'en': enKeys,
        'es': esKeys,
      };

  String translate(String key) {
    if (!keys[currentLocale]!.containsKey(key)) {
      return key;
    } else {
      return keys[currentLocale]![key] ?? key;
    }
  }
}
