import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/modules/checkout/checkout_controller.dart';
import 'package:howabout_coffee/app/modules/home/home_controller.dart';
import 'package:howabout_coffee/app/modules/home/home_page.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => HomeController(userService: context.read()),
          ),
          Provider(
            create: (context) => CheckoutController(
              userService: context.read(),
              locationService: context.read(),
              companyController: context.read(),
              env: context.read(),
            ),
          ),
        ],
        builder: (context, child) => const HomePage(),
      );
}
