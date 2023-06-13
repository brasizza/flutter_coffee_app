import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/modules/checkout/checkout_controller.dart';
import 'package:howabout_coffee/app/modules/checkout/checkout_page.dart';
import 'package:provider/provider.dart';

class CheckoutRouter {
  CheckoutRouter._();

  static Widget page({required CheckoutController checkoutController, required ClientModel client}) => MultiProvider(
        providers: [
          Provider.value(value: checkoutController),
        ],
        builder: (context, _) => CheckoutPage(client: client),
      );
}
