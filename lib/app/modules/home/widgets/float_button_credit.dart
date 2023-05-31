// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';

import '../../wallet/wallet_router.dart';

class FloatButtonCredit extends StatelessWidget {
  final ClientModel? client;
  const FloatButtonCredit({
    Key? key,
    this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isOpen = false;
    return FloatingActionButton(
      backgroundColor: ColorsApp.instance.primary,
      onPressed: () async {
        if (isOpen == false) {
          isOpen = true;
          showBottomSheet(
            enableDrag: false,
            elevation: 0,
            context: context,
            builder: (context) {
              WalletRouter.client = client;
              return StatefulBuilder(
                builder: (context, setState) {
                  return WalletRouter.page;
                },
              );
            },
          ).closed.then((value) => isOpen = false);
        } else {
          Navigator.maybePop(context);
        }
      },
      child: const Icon(
        Icons.qr_code_scanner_sharp,
        size: 30,
      ),
    );
  }
}
