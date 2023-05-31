// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:howabout_coffee/app/core/company/company_controller.dart';
import 'package:howabout_coffee/app/core/extensions/size_extensions.dart';
import 'package:howabout_coffee/app/data/models/product_model_checkout.dart';
import 'package:howabout_coffee/app/modules/checkout/checkout_controller.dart';

import '../../../core/global/translation/app_translation.dart';
import '../../../core/ui/styles/color_app.dart';

class CheckoutProduct extends StatelessWidget {
  final ProductModelCheckout product;
  final CompanyController companyController;
  final CheckoutController controller;
  final int index;
  const CheckoutProduct({
    Key? key,
    required this.product,
    required this.companyController,
    required this.controller,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = '';
    switch (AppTranslation.currentLocale) {
      case 'pt':
        title = product.titlePT;
        break;
      case 'es':
        title = product.titleES;
        break;
      case 'en':
        title = product.titleEN;
        break;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        height: 170,
        width: context.screenWidth,
        decoration: BoxDecoration(color: const Color(0xff141921), borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      color: ColorsApp.instance.primary,
                      image: DecorationImage(
                        image: ((product.image == null) ? const AssetImage('assets/images/logo_coffee.png') : NetworkImage(product.image!)) as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.clip,

                        // product.title,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      // Text(
                      //   ingredients[index],
                      //   style: const TextStyle(color: Color(0xff919293), fontSize: 12),
                      // ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                                child: Text(
                                  companyController.company?.moneySymbol ?? r'$',
                                  style: TextStyle(color: ColorsApp.instance.primary, fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ),
                              Text(
                                (product.price).toStringAsFixed(2),
                                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Text(
                            (product.price * product.quantity).toStringAsFixed(2),
                            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: SpinBox(
                                readOnly: true,
                                incrementIcon: Icon(
                                  Icons.add,
                                  color: ColorsApp.instance.primary,
                                ),
                                decrementIcon: (product.quantity == 1)
                                    ? Icon(
                                        Icons.delete,
                                        color: ColorsApp.instance.primary,
                                      )
                                    : Icon(
                                        Icons.remove,
                                        color: ColorsApp.instance.primary,
                                      ),
                                textStyle: TextStyle(color: ColorsApp.instance.primary),
                                decoration: const InputDecoration(
                                  fillColor: Colors.transparent,
                                  border: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                min: 0,
                                max: 100,
                                spacing: 0,
                                value: product.quantity.toDouble(),
                                onChanged: (value) {
                                  if (value == 0) {
                                    controller.removeItem(index);
                                  } else {
                                    controller.updateProduct(product, value.toInt(), index);
                                  }
                                  // setState(() {
                                  //   quantity = value.toInt();
                                  // });
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
