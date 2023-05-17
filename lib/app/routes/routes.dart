import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/modules/home/home_router.dart';
import 'package:howabout_coffee/app/modules/login/sign_up/sign_up_router.dart';

import '../modules/login/login_router.dart';
import '../modules/presentation/presentation_router.dart';
import '../modules/splash/splash_router.dart';

class Routes {
  static Routes? _instance;
  // Avoid self isntance
  Routes._();
  static Routes get instance {
    _instance ??= Routes._();
    return _instance!;
  }

  Map<String, WidgetBuilder> get routes {
    return {
      '/': (context) => SplashRouter.page,
      '/presentation': (context) => PresentationRouter.page,
      '/login': (context) => LoginRouter.page,
      '/login/sign-up': (context) => SignUpRouter.page,
      '/home': (context) => HomeRouter.page,
    };
  }
}
