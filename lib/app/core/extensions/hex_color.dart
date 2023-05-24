import 'package:flutter/material.dart';

extension HexConversor on String {
  Color hexToColor() {
    String hexColor = toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    } else {
      hexColor = 'FF6495ED';
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
