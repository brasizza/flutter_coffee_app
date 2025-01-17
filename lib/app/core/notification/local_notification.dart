import 'dart:async';
import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';

class LocalNotificationService {
  //Singleton pattern
  static final LocalNotificationService _notificationService = LocalNotificationService._internal();

  factory LocalNotificationService() {
    return _notificationService;
  }

  LocalNotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static const channelId = '123';
  static const channelName = 'FlutterParse';
  static const channelDescription = 'FlutterParseNotification';
  final StreamController<Map<String, dynamic>> controllerPayload = StreamController<Map<String, dynamic>>();
  Stream<Map<String, dynamic>> get streamPayload => controllerPayload.stream;

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('ic_stat_push');

    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS, macOS: null);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  final AndroidNotificationDetails _androidNotificationDetails = AndroidNotificationDetails(
    channelId,
    channelName,
    channelDescription: channelDescription,
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
    colorized: true,
    color: ColorsApp.instance.black,
    enableLights: true,
    enableVibration: true,
  );

  Future<void> showNotifications({required int code, required String title, required String body, String? payload}) async {
    await flutterLocalNotificationsPlugin.show(code, title, body, NotificationDetails(android: _androidNotificationDetails), payload: payload);
  }

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    if (notificationResponse.payload != null) {
      final payload = jsonDecode(notificationResponse.payload!);
      controllerPayload.sink.add(payload);
    }
  }

  Future<void> cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  void close() {
    controllerPayload.close();
  }
}
