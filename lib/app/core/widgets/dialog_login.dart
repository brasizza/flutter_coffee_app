import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class DialogLogin extends StatelessWidget {
  const DialogLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('login.welcome'.translate),
      content: Text('login.welcome.description'.translate),
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
            await context.read<AuthService>().signOut();
            nav.pushNamedAndRemoveUntil('/login', (route) => false);
          },
          child: Text('label.yes'.translate),
        )
      ],
    );
  }
}
