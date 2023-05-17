import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/modules/login/login_controller.dart';
import 'package:howabout_coffee/app/modules/login/login_page.dart';
import 'package:provider/provider.dart';

class LoginRouter {
  LoginRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(create: (context) => LoginController(authService: context.read(), userService: context.read())),
        ],
        child: const LoginPage(),
      );
}
