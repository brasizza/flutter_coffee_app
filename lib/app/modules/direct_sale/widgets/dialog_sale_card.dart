import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/extensions/size_extensions.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/core/ui/styles/text_styles.dart';
import 'package:howabout_coffee/app/data/models/direct_sale.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class DialogSaleCard extends StatelessWidget {
  final DirectSale sale;

  const DialogSaleCard({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * .6,
      // color: ColorsApp.instance.black,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'wallet.cosume_item'.translate,
              style: context.textStyles.textTitle.copyWith(color: ColorsApp.instance.fontColor), //TextStyle(color: ColorsApp.instance.fontColor, fontSize: context.textStyles.textTitle, fontWeight: FontWeight.bold),
              softWrap: true,
              maxLines: 2,
            ),
          ),
          Expanded(
            child: PrettyQr(
              elementColor: ColorsApp.instance.fontColor,
              typeNumber: 5,
              data: 'product:${sale.objectId!}',
              size: context.screenHeight * .4,
              errorCorrectLevel: QrErrorCorrectLevel.M,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.maybePop(context);
              },
              child: Text('btn.close'.translate),
            ),
          )
        ],
      ),
    );
  }
}
