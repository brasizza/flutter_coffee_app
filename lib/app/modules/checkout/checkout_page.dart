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
import 'package:transformable_list_view/transformable_list_view.dart';

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
            );
          },
          builder: (context, state) {
            return Visibility(
              visible: state.transaction.products.isNotEmpty,
              replacement: const EmptyCart(),
              child: Column(
                children: [
                  TotalWidget(transaction: state.transaction, companyController: context.read()),
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
                          controller.validatePayment();
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
