import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/data/repositories/favorites/favorite_repository.dart';
import 'package:howabout_coffee/app/data/services/favorite/favorite_service.dart';
import 'package:howabout_coffee/app/data/services/favorite/favorite_service_impl.dart';
import 'package:howabout_coffee/app/modules/checkout/checkout_controller.dart';
import 'package:howabout_coffee/app/modules/favorite/favorite_controller.dart';
import 'package:howabout_coffee/app/modules/favorite/favorite_page.dart';
import 'package:howabout_coffee/app/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

import '../../data/repositories/favorites/favorite_repository_impl.dart';

class FavoriteRoute {
  FavoriteRoute._();
  static Widget page({required CheckoutController checkoutController, required HomeController homeController}) => MultiProvider(
        providers: [
          Provider.value(value: checkoutController),
          Provider.value(value: homeController),
          Provider<FavoriteRepository>(create: (context) => FavoriteRepositoryImpl()),
          Provider<FavoriteService>(create: (context) => FavoriteServiceImpl(repository: context.read())),
          Provider(create: (context) => FavoriteController(service: context.read(), userService: context.read())),
        ],
        builder: (context, child) => const FavoritePage(),
      );
}
