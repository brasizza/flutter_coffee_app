// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/local_storage/local_storage.dart';

class SplashController {
  final LocalStorage _localStorage;
  SplashController({
    required LocalStorage storage,
  }) : _localStorage = storage;
  Future<void> addLocale(Locale locale) async {
    await _localStorage.setData('locale', locale.languageCode);
  }
}
