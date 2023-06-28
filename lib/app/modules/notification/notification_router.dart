import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/notification/notification_controller.dart';
import 'package:howabout_coffee/app/modules/notification/notification_page.dart';
import 'package:provider/provider.dart';

class NotificationRouter {
  NotificationRouter._();
  static Widget page({required NotificationController notificationController}) => MultiProvider(
        providers: [
          Provider.value(value: notificationController),
        ],
        builder: (context, child) => const NotificationPage(),
      );
}
