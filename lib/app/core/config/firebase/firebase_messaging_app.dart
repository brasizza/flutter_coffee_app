import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../notification/local_notification.dart';

class FirebaseMessagingApp {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> init() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
      return;
    }

    await messaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

    messaging.getToken().then((value) async {
      assert(value != null);
      final installation = await ParseInstallation.currentInstallation();
      installation.deviceToken = value;
      await installation.create();
    });

    messaging.onTokenRefresh.listen((value) async {
      final installation = await ParseInstallation.currentInstallation();
      installation.deviceToken = value;
      await installation.create();
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null && message.notification?.android != null) {
        LocalNotificationService().showNotifications(code: message.hashCode, title: message.notification!.title!, body: message.notification!.body!, payload: jsonEncode(message.data));
      }
    });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   setState(() {
    //     payload = message.data;
    //   });
    // });

    // LocalNotificationService().streamPayload.listen((data) {
    //   setState(() {
    //     payload = data;
    //   });
    // });
  }
}
