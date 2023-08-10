import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/ui/styles/text_styles.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/direct_sale/direct_sale_controller.dart';
import 'package:howabout_coffee/app/modules/direct_sale/state/direct_sale_state.dart';
import 'package:howabout_coffee/app/modules/direct_sale/widgets/card_sale.dart';

import '../../core/ui/styles/color_app.dart';

class DirectSalePage extends StatefulWidget {
  const DirectSalePage({super.key});

  @override
  State<DirectSalePage> createState() => _DirectSalePageState();
}

class _DirectSalePageState extends BaseState<DirectSalePage, DirectSaleController> {
  @override
  void onReady() {
    super.onReady();
    controller.getDirectSales(client: context.read<UserService>().currentUser!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<DirectSaleController, DirectSaleState>(
            listener: (context, state) {},
            buildWhen: ((previous, current) => current.status.matchAny(
                  any: (() => false),
                  initial: (() => true),
                  loaded: (() => true),
                  loading: (() => true),
                )),
            builder: (context, state) {
              if (state.status == DirectSaleStatus.loaded) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'wallet.direct_sale'.translate,
                        style: context.textStyles.textTitle.copyWith(color: ColorsApp.instance.fontColor), //TextStyle(color: ColorsApp.instance.fontColor, fontSize: context.textStyles.textTitle, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.sales.length,
                        itemBuilder: (context, index) => CardSale(sale: state.sales[index], controller: controller, client: context.read<UserService>().currentUser!),
                      ),
                    ),
                  ],
                );
              }

              return const Center(child: CircularProgressIndicator());
            }));
  }
}
