import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => Colors.orange;
  Color get secondary => Colors.orangeAccent;
  Color get black => Colors.black;
  Color get white => Colors.white;
  Color get fontColor => (primary.computeLuminance() > 0.5 ? Colors.black : Colors.white);
}

extension ColorsAppExcetions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
