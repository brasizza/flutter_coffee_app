import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/data/repositories/categories/categories_repository.dart';
import 'package:howabout_coffee/app/data/repositories/categories/categories_repository_impl.dart';
import 'package:howabout_coffee/app/data/repositories/products/products_repository.dart';
import 'package:howabout_coffee/app/data/repositories/products/products_repository_impl.dart';
import 'package:howabout_coffee/app/data/services/categories/categories_service.dart';
import 'package:howabout_coffee/app/data/services/categories/categories_service_impl.dart';
import 'package:howabout_coffee/app/data/services/products/products_service.dart';
import 'package:howabout_coffee/app/data/services/products/products_service_impl.dart';
import 'package:howabout_coffee/app/modules/home/home_controller.dart';
import 'package:howabout_coffee/app/modules/home/home_page.dart';
import 'package:howabout_coffee/app/modules/products/products_controller.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductsRepositoryImpl(rest: context.read()),
          ),
          Provider<CategoriesRepository>(
            create: (context) => CategoriesRepositoryImpl(rest: context.read()),
          ),
          Provider<CategoriesService>(
            create: (context) => CategoriesServiceImpl(repository: context.read()),
          ),
          Provider<ProductsService>(
            create: (context) => ProductsServiceImpl(repository: context.read()),
          ),
          Provider(
            create: (context) => ProductsController(categoriesService: context.read(), productsService: context.read()),
          ),
          Provider(
            create: (context) => HomeController(productsController: context.read(), userService: context.read()),
          ),
        ],
        builder: (context, child) => HomePage(translation: context.read()),
      );
}
