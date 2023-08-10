// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/repositories/direct_sales/direct_sale_repository.dart';
import 'package:howabout_coffee/app/data/repositories/direct_sales/direct_sale_repository_impl.dart';
import 'package:howabout_coffee/app/data/services/direct_sale/directsale_service.dart';
import 'package:howabout_coffee/app/data/services/direct_sale/directsale_service_impl.dart';
import 'package:howabout_coffee/app/modules/direct_sale/direct_sale_controller.dart';
import 'package:howabout_coffee/app/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

import '../../wallet/wallet_controller.dart';
import '../../wallet/wallet_page.dart';

class FloatButtonCredit extends StatelessWidget {
  final ClientModel? client;
  const FloatButtonCredit({
    Key? key,
    this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorsApp.instance.primary,
      onPressed: () async {
        final homeController = context.read<HomeController>();
        await showModalBottomSheet(
          enableDrag: true,
          isScrollControlled: true,
          elevation: 0,
          context: context,
          builder: (context) {
            return MultiProvider(
              providers: [
                Provider(
                  create: ((context) => WalletController(userService: context.read())),
                ),
                Provider<DirectSaleRepository>(
                  create: ((context) => DirectSaleRepositoryImpl()),
                ),
                Provider<DirectsaleService>(
                  create: ((context) => DirectsaleServiceImpl(repository: context.read())),
                ),
                Provider(
                  create: ((context) => DirectSaleController(userService: context.read(), service: context.read())),
                ),
              ],
              builder: (context, child) => WalletPage(client: client),
            );
          },
        );
        homeController.refreshUser(client);
      },
      child: const Icon(
        Icons.qr_code_scanner_sharp,
        size: 30,
      ),
    );
  }
}
