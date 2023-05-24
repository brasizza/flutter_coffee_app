class Consts {
  static Consts? _instance;
  // Avoid self isntance
  Consts._();
  static Consts get instance {
    _instance ??= Consts._();
    return _instance!;
  }

  static String vendusKey = '286633d638810f1948e446c1e65ace66';
  static String keyApplicationId = 'CLgtsEQDDyURg0PVDTHl0cvXnumni35w9mELNWdq';
  static String keyParseServerUrl = 'https://parseapi.back4app.com';
  static String keyClientKey = 'EifwmX6DzG3r6xNhUgTpL8mdUlqF1fobYB0YV4pq';
  static String urlVendus = 'https://www.vendus.pt/ws/v1.1';
}
