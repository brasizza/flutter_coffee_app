extension HexInt on String {
  int hexColorInt() {
    String hexColor = toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    } else {
      hexColor = 'FF6495ED';
    }
    return (int.parse(hexColor, radix: 16));
  }
}
