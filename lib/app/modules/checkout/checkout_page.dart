import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/widgets/my_button.dart';
import 'package:howabout_coffee/app/modules/checkout/checkout_controller.dart';
import 'package:howabout_coffee/app/modules/checkout/state/checkout_state.dart';
import 'package:howabout_coffee/app/modules/checkout/widgets/checkout_product.dart';
import 'package:howabout_coffee/app/modules/checkout/widgets/empty_cart.dart';
import 'package:howabout_coffee/app/modules/checkout/widgets/total_widget.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends BaseState<CheckoutPage, CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CheckoutController, CheckoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Visibility(
            visible: state.transaction.products.isNotEmpty,
            replacement: const EmptyCart(),
            child: Column(
              children: [
                TotalWidget(transaction: state.transaction, companyController: context.read()),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CheckoutProduct(
                        product: state.transaction.products[index],
                        companyController: context.read(),
                      );
                    },
                    itemCount: state.transaction.products.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyButton(onTap: () {}, text: 'checkout.pay'.translate),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
