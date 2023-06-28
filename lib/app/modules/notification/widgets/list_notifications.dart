import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/data/models/notification_model.dart';
import 'package:howabout_coffee/app/modules/notification/widgets/item_notification.dart';

class ListNotifications extends StatefulWidget {
  final List<NotificationModel> notifications;

  const ListNotifications({super.key, required this.notifications});

  @override
  State<ListNotifications> createState() => _ListNotificationsState();
}

class _ListNotificationsState extends State<ListNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: widget.notifications.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final notification = widget.notifications[index];
          return ItemNotification(notification: notification);
        },
      ),
    );
  }
}
