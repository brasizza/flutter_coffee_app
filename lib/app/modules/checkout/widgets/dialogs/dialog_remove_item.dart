import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/global/translation/app_translation.dart';
import 'package:howabout_coffee/app/modules/checkout/checkout_controller.dart';

class DialogRemoveItem extends StatelessWidget {
  final CheckoutController controller;
  const DialogRemoveItem({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    String title = '';
    switch (AppTranslation.currentLocale) {
      case 'pt':
        title = controller.state.removedItem?.titlePT ?? '';
        break;
      case 'es':
        title = controller.state.removedItem?.titleES ?? '';
        break;
      case 'en':
        title = controller.state.removedItem?.titleEN ?? '';
        break;
    }
    return AlertDialog(
      title: Text('checkout.remove.product'.translate),
      content: Text('checkout.remove.product_description'.translate.replaceFirst('%%ITEM%%', title)),
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
            if (controller.state.removedItem != null) {
              controller.removeItem(controller.state.removedItem!);
              Navigator.maybePop(context);
            }
          },
          child: Text('label.yes'.translate),
        )
      ],
    );
  }
}
