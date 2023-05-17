import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';
import 'package:howabout_coffee/app/modules/home/home_controller.dart';
import 'package:howabout_coffee/app/modules/home/home_page.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(create: (context) => HomeController()..checkUser(context.read<AuthService>().getCurrentUser())),
        ],
        child: const HomePage(),
      );
}
