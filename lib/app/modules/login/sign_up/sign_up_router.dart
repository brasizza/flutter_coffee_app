import 'package:flutter/cupertino.dart';
import 'package:howabout_coffee/app/modules/login/sign_up/sign_up_controller.dart';
import 'package:howabout_coffee/app/modules/login/sign_up/sign_up_page.dart';
import 'package:provider/provider.dart';

class SignUpRouter {
  SignUpRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
              create: (context) => SignUpController(
                    auth: context.read(),
                  )),
        ],
        builder: (context, child) => SignupPage(translation: context.read()),
        // child: const SignupPage(translation: ),
      );
}
