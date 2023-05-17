import 'package:flutter/material.dart';

class AppConfigUI {
  AppConfigUI._();

  static final MaterialColor _primarySwatch = _createMaterialColor(Colors.orange);

  static final ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
    ),
    fontFamily: 'Roboto',
    primarySwatch: _primarySwatch,
    primaryColor: Colors.orange,
    primaryColorLight: Colors.orange.withOpacity(.8),
    // primaryColor: Colors.white,
    // primaryColorLight: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[850]!),
      ),
      labelStyle: const TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.black,
  );
}

MaterialColor _createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
