import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/widgets/my_button.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/modules/checkout/checkout_controller.dart';
import 'package:howabout_coffee/app/modules/checkout/state/checkout_state.dart';
import 'package:howabout_coffee/app/modules/checkout/widgets/checkout_product.dart';
import 'package:howabout_coffee/app/modules/checkout/widgets/dialogs/dialog_proceed_checkout.dart';
import 'package:howabout_coffee/app/modules/checkout/widgets/dialogs/dialog_remove_all_items.dart';
import 'package:howabout_coffee/app/modules/checkout/widgets/empty_cart.dart';
import 'package:howabout_coffee/app/modules/checkout/widgets/total_widget.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

import 'widgets/dialogs/dialog_remove_item.dart';

class CheckoutPage extends StatefulWidget {
  final ClientModel client;
  const CheckoutPage({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends BaseState<CheckoutPage, CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<CheckoutController, CheckoutState>(
          listener: (context, state) {
            state.status.matchAny(
              any: (() => hideLoader()),
              loading: (() => showLoader()),
              error: () {
                hideLoader();
                showError(state.errorMessage ?? ' Erro');
              },
              errorRange: () {
                hideLoader();
                showError(state.errorMessage ?? ' Erro');
              },
              askToRemove: () async => await showDialog(barrierDismissible: false, context: context, builder: (_) => DialogRemoveItem(controller: controller)),
              askToClearAll: () async => await showDialog(barrierDismissible: false, context: context, builder: (_) => DialogToRemoveAllItems(controller: controller)),
              askToProceedCheckout: () async => await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => DialogProceedCheckout(
                        controller: controller,
                        client: widget.client,
                      )),
              checkoutFinished: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
                showSuccess('checkout.finish_checkout_completed'.translate);
              },
            );
          },
          builder: (context, state) {
            return Visibility(
              visible: state.transaction.products.isNotEmpty,
              replacement: EmptyCart(message: 'emptycart.message'.translate),
              child: Column(
                children: [
                  TotalWidget(
                    transaction: state.transaction,
                    companyController: context.read(),
                    client: widget.client,
                  ),
                  Expanded(
                    child: TransformableListView.builder(
                      getTransformMatrix: getTransformMatrix,
                      itemBuilder: (context, index) {
                        return CheckoutProduct(
                          product: state.transaction.products[index],
                          companyController: context.read(),
                          controller: controller,
                          index: index,
                        );
                      },
                      itemCount: state.transaction.products.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MyButton(
                        onTap: () async {
                          if (state.transaction.totalTransaction > (widget.client.totalCredit ?? 0.00)) {
                            showError('checkout.error.limite'.translate);
                          } else {
                            controller.validatePayment();
                          }
                        },
                        text: 'checkout.pay'.translate),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Matrix4 getTransformMatrix(TransformableListItem item) {
    /// final scale of child when the animation is completed
    const endScaleBound = 0.3;

    /// 0 when animation completed and [scale] == [endScaleBound]
    /// 1 when animation starts and [scale] == 1
    final animationProgress = item.visibleExtent / item.size.height;

    /// result matrix
    final paintTransform = Matrix4.identity();

    /// animate only if item is on edge
    if (item.position != TransformableListItemPosition.middle) {
      final scale = endScaleBound + ((1 - endScaleBound) * animationProgress);

      paintTransform
        ..translate(item.size.width / 2)
        ..scale(scale)
        ..translate(-item.size.width / 2);
    }

    return paintTransform;
  }
}
