import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslation extends Translations {
  Map<String, String> ptKeys = {};
  Map<String, String> enKeys = {};
  Map<String, String> esKeys = {};
  init() async {
    ptKeys = Map<String, String>.from(jsonDecode(await rootBundle.loadString('assets/locales/pt.json')));
    esKeys = Map<String, String>.from(jsonDecode(await rootBundle.loadString('assets/locales/es.json')));
    enKeys = Map<String, String>.from(jsonDecode(await rootBundle.loadString('assets/locales/en.json')));

    return this;
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'pt': ptKeys,
        'en': enKeys,
        'es': esKeys,
      };
}
