import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/data/repositories/checkout/checkout_repository.dart';
import 'package:howabout_coffee/app/data/repositories/checkout/checkout_repository_impl.dart';
import 'package:howabout_coffee/app/data/services/checkout/checkout_service.dart';
import 'package:howabout_coffee/app/data/services/checkout/checkout_service_impl.dart';
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
          Provider<CheckoutRepository>(create: (context) => CheckoutRepositoryImpl()),
          Provider<CheckoutService>(
            create: (context) => CheckoutServiceImpl(repository: context.read()),
          ),
          Provider(
            create: (context) => CheckoutController(
              userService: context.read(),
              service: context.read(),
              locationService: context.read(),
              companyController: context.read(),
              env: context.read(),
            ),
          ),
        ],
        builder: (context, child) => const HomePage(),
      );
}
