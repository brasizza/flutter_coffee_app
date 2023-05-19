import 'dart:core';

import 'package:intl/intl.dart';

extension FormatterNumber on String {
  String toMoney({String? locale, int decimals = 2, String? symbol}) {
    NumberFormat formatter = NumberFormat.currency(decimalDigits: 2, name: '', symbol: '');
    return formatter.format(double.parse(this));
  }
}
