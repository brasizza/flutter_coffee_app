import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/company/company_controller.dart';
import 'package:howabout_coffee/app/core/extensions/size_extensions.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/core/ui/styles/text_styles.dart';
import 'package:howabout_coffee/app/data/dto/transaction_model.dart';

import '../checkout_controller.dart';

class TotalWidget extends StatelessWidget {
  final TransactionModel transaction;
  final CompanyController companyController;
  const TotalWidget({Key? key, required this.transaction, required this.companyController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 80,
        width: context.screenWidth,
        decoration: BoxDecoration(color: const Color(0xff141921).withOpacity(.3), borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'checkout.total_account'.translate,
                style: context.textStyles.textBold.copyWith(color: ColorsApp.instance.fontColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Chip(
                backgroundColor: ColorsApp.instance.primary,
                label: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Text(
                        companyController.company?.moneySymbol ?? r'$',
                        style: TextStyle(color: ColorsApp.instance.fontColor, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text(
                      transaction.totalTransaction.toStringAsFixed(2),
                      style: TextStyle(color: ColorsApp.instance.fontColor, fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  context.read<CheckoutController>().clear();
                },
                icon: Icon(
                  Icons.delete,
                  color: ColorsApp.instance.primary,
                ))
          ],
        ),
      ),
    );
  }
}
