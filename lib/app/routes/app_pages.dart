import 'home_routes.dart';
import 'splash_routes.dart';
import 'login_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = '/splash';

  static final routes = [
    ...HomeRoutes.routes,
    ...SplashRoutes.routes,
		...LoginRoutes.routes,
  ];
}
