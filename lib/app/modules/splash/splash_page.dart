import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/global/translation/app_translation.dart';
import 'package:howabout_coffee/app/modules/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final locale = Localizations.localeOf(context);
      final nav = Navigator.of(context);
      final appTranslation = context.read<AppTranslation>();
      await context.read<SplashController>().addLocale(locale);
      appTranslation.currentLocale = locale.languageCode;
      nav.pushReplacementNamed('/presentation');
      // });
    });

    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo_coffee_transparente.png'),
          const CircularProgressIndicator.adaptive(
            backgroundColor: Colors.white,
          )
        ],
      ),
    ));
  }
}
