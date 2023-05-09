import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              Image.asset('assets/images/logo_coffee.png'),
              const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              )
            ],
          ),
        ));
  }
}
