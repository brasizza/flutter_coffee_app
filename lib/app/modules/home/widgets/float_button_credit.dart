// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
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
          enableDrag: false,
          elevation: 0,
          context: context,
          builder: (context) {
            return MultiProvider(
              providers: [
                Provider(
                  create: ((context) => WalletController(userService: context.read())),
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
