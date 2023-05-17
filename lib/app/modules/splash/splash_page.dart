import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.of(context).pushReplacementNamed('/presentation');
      });
    });

    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
