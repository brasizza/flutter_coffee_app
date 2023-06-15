import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:howabout_coffee/app/app_widget.dart';
import 'package:howabout_coffee/app/core/config/b4a_config.dart';
import 'package:howabout_coffee/app/core/config/env_maker.dart';
import 'package:howabout_coffee/app/core/config/firebase/firebase_config.dart';
import 'package:howabout_coffee/app/core/config/firebase/firebase_messaging_app.dart';
import 'package:howabout_coffee/app/core/global/translation/app_translation.dart';
import 'package:howabout_coffee/app/core/notification/local_notification.dart';
import 'package:howabout_coffee/app/data/enums/config_types.dart';

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("Handling a background message");
  await FirebaseConfig().init();

  if (message.notification != null) {
    LocalNotificationService().showNotifications(code: message.hashCode, title: (message.notification?.title ?? ''), body: (message.notification?.body ?? ''), payload: jsonEncode(message.data));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await B4aConfig().init();
  await FirebaseConfig().init();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await LocalNotificationService().init();
  await AppTranslation.init();
  await FirebaseMessagingApp().init();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final env = await EnvMaker.create(ConfigType.b4app);
  runApp(AppWidget(
    env: env,
  ));
}
