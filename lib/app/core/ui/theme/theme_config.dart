import 'package:flutter/material.dart';

import '../styles/app_style.dart';
import '../styles/color_app.dart';
import '../styles/text_styles.dart';

class ThemeConfig {
  static final MaterialColor _primarySwatch = _createMaterialColor(Colors.orange);

  ThemeConfig._();
  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );

  static final theme = ThemeData(
    fontFamily: 'Montserrat',
    primarySwatch: _primarySwatch,
    primaryColor: ColorsApp.instance.primary,
    primaryColorLight: ColorsApp.instance.primary.withOpacity(.8),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsApp.instance.black,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: ColorsApp.instance.black,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsApp.instance.black,
      elevation: 0,
      selectedItemColor: ColorsApp.instance.primary,
      unselectedItemColor: ColorsApp.instance.white,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instance.primary,
      primary: ColorsApp.instance.primary,
      secondary: ColorsApp.instance.secondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: AppStyles.instance.primaryButton),
    scaffoldBackgroundColor: ColorsApp.instance.black,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(20),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: TextStyles.instance.textRegular.copyWith(color: Colors.black),
      errorStyle: TextStyles.instance.textRegular.copyWith(color: Colors.redAccent),
    ),
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
