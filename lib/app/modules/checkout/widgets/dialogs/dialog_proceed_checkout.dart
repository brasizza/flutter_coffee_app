import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/modules/checkout/checkout_controller.dart';

class DialogProceedCheckout extends StatelessWidget {
  final CheckoutController controller;
  final ClientModel client;

  const DialogProceedCheckout({super.key, required this.controller, required this.client});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('checkout.finish_checkout'.translate),
      content: Text('checkout.finish_checkout_description'.translate.replaceFirst('%%CREDIT_SPEND%%', controller.state.transaction.totalTransaction.toStringAsFixed(2))),
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
            Navigator.maybePop(context);
            controller.checkout(transaction: controller.state.transaction, client: client);
          },
          child: Text('label.yes'.translate),
        )
      ],
    );
  }
}
