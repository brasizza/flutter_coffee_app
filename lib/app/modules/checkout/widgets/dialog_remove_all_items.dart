import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/modules/checkout/checkout_controller.dart';

class DialogToRemoveAllItems extends StatelessWidget {
  final CheckoutController controller;
  const DialogToRemoveAllItems({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('checkout.remove.all'.translate),
      content: Text('checkout.remove.all_description'.translate),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.maybePop(context);
            controller.cancelProcess();
          },
          child: Text('label.no'.translate),
        ),
        ElevatedButton(
          onPressed: () {
            controller.clear();
            Navigator.maybePop(context);
          },
          child: Text('label.yes'.translate),
        )
      ],
    );
  }
}
