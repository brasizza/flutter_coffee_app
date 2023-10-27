import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/modules/profile/profile_controller.dart';

class DialogRemoveAccount extends StatelessWidget {
  final ProfileController controller;

  const DialogRemoveAccount({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('profile.remove.account'.translate),
      content: Text('profile.remove.account.description'.translate),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).maybePop(false);
          },
          child: Text('label.no'.translate),
        ),
        ElevatedButton(
          onPressed: () async {
            final nav = Navigator.of(context);
            await controller.removeAccount();
            nav.maybePop(true);
          },
          child: Text('label.yes'.translate),
        )
      ],
    );
  }
}
