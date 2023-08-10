import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';

class RemoveNotification extends StatelessWidget {
  const RemoveNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('notification.remove'.translate),
      content: Text('notification.remove.description'.translate),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.maybePop(context, false);
          },
          child: Text('label.no'.translate),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.maybePop(context, true);
          },
          child: Text('label.yes'.translate),
        )
      ],
    );
  }
}
