import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/notification/notification_controller.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/modules/notification/widgets/list_notifications.dart';
import 'package:howabout_coffee/app/modules/notification/widgets/no_notification.dart';

import '../../core/notification/state/notification_state.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends BaseState<NotificationPage, NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<NotificationController, NotificationState>(
            listener: (context, state) {},
            builder: (context, state) {
              final notifications = state.notifications.where((not) => not.read == false).toList();
              return Visibility(
                visible: notifications.length > 1,
                replacement: const NoNotification(),
                child: ListNotifications(notifications: notifications),
              );
            }));
  }
}
