import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/modules/splash/splash_controller.dart';
import 'package:howabout_coffee/app/modules/splash/splash_page.dart';
import 'package:provider/provider.dart';

class SplashRouter {
  SplashRouter._();

  static Widget get page => MultiProvider(
        providers: [Provider(create: ((context) => SplashController(storage: context.read())))],
        child: const SplashPage(),
      );
}
