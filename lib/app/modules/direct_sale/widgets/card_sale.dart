import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/ui/styles/text_styles.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/modules/direct_sale/direct_sale_controller.dart';
import 'package:howabout_coffee/app/modules/direct_sale/widgets/dialog_sale_card.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../core/global/translation/app_translation.dart';
import '../../../core/ui/styles/color_app.dart';
import '../../../data/models/direct_sale.dart';

class CardSale extends StatelessWidget {
  final DirectSale sale;
  final DirectSaleController controller;
  final ClientModel client;

  const CardSale({super.key, required this.sale, required this.controller, required this.client});

  @override
  Widget build(BuildContext context) {
    String title = '';
    switch (AppTranslation.currentLocale) {
      case 'pt':
        title = sale.product?.titlePT ?? '';

        break;

      case 'es':
        title = sale.product?.titleES ?? '';

        break;

      case 'en':
        title = sale.product?.titleEN ?? '';

        break;
    }

    return GestureDetector(
      onTap: () async {
        await showModalBottomSheet(
          enableDrag: false,
          isScrollControlled: true,
          backgroundColor: ColorsApp.instance.black,
          context: context,
          builder: (_) => DialogSaleCard(
            sale: sale,
          ),
        );

        controller.getDirectSales(client: client);
      },
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              PrettyQr(
                elementColor: ColorsApp.instance.fontColor,
                typeNumber: 5,
                data: 'product:${sale.objectId!}',
                errorCorrectLevel: QrErrorCorrectLevel.M,
              ),
              Text(
                title,
                style: context.textStyles.textMedium.copyWith(color: ColorsApp.instance.fontColor),
                softWrap: true,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
