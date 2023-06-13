import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/company/company_controller.dart';
import 'package:howabout_coffee/app/core/extensions/size_extensions.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/core/ui/styles/text_styles.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/models/transaction_model.dart';

import '../checkout_controller.dart';

class TotalWidget extends StatelessWidget {
  final TransactionModel transaction;
  final CompanyController companyController;
  final ClientModel client;
  const TotalWidget({Key? key, required this.transaction, required this.companyController, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 150,
        width: context.screenWidth,
        decoration: BoxDecoration(color: const Color(0xff141921).withOpacity(.3), borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  context.read<CheckoutController>().askToClearAll();
                },
                icon: Icon(
                  Icons.delete,
                  color: ColorsApp.instance.primary,
                )),
            Row(
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
                            style: context.textStyles.textButtonLabel.copyWith(color: ColorsApp.instance.fontColor),
                          ),
                        ),
                        Text(
                          transaction.totalTransaction.toStringAsFixed(2),
                          style: context.textStyles.textButtonLabel.copyWith(color: ColorsApp.instance.fontColor),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25.0),
              child: Chip(
                backgroundColor: ColorsApp.instance.primary,
                label: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'wallet.ballance'.translate,
                      style: context.textStyles.textButtonLabel.copyWith(color: ColorsApp.instance.fontColor),
                    ),
                    Text(
                      "${companyController.company?.moneySymbol ?? r'$ '} ${client.totalCredit!.toStringAsFixed(2)}",
                      style: context.textStyles.textButtonLabel.copyWith(color: ColorsApp.instance.fontColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
