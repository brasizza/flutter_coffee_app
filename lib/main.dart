import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:howabout_coffee/app/core/ui/ui.dart';

import 'app/core/bindings/application_bindings.dart';
import 'app/core/translation/app_translation.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    GetMaterialApp(
      fallbackLocale: const Locale('pt', 'BR'),
      locale: Get.deviceLocale,
      translations: await AppTranslation().init(),
      debugShowCheckedModeBanner: false,
      title: 'How about coffee',
      initialBinding: ApplicationBindings(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppConfigUI.theme,
    ),
  );
}
