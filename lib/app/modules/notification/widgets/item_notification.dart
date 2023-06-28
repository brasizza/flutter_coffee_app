import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/data/models/notification_model.dart';

class ItemNotification extends StatelessWidget {
  final NotificationModel notification;
  const ItemNotification({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color(0xff242931), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [Text(notification.title)],
      ),
    );
  }
}
