import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/modules/wallet/wallet_controller.dart';
import 'package:howabout_coffee/app/modules/wallet/wallet_page.dart';
import 'package:provider/provider.dart';

import '../../data/models/client_model.dart';

class WalletRouter {
  WalletRouter._();

  static late ClientModel? client;
  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: ((context) => WalletController(userService: context.read())..addUser(client)),
          ),
        ],
        builder: (context, child) => WalletPage(client: client),
      );
}
