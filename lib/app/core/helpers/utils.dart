import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  Utils._();

  static const String empresaModel = '/empresa_model/';
  static const String usuarioModel = '/usuario_model/';
  static const String vendaModel = '/venda_model/';
  static const String remoteConfig = '/remote_config/';

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;

  static String formatNumber(String number) {
    String result;
    result = NumberFormat('###.##').format(double.parse(number));
    return result;
    // NumberFormat();
  }

  static Color hexColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    } else {
      hexColor = 'FF6495ED';
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  static int hexColorInt(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    } else {
      hexColor = 'FF6495ED';
    }
    return (int.parse(hexColor, radix: 16));
  }
}
