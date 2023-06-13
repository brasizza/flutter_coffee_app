import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/company/company_controller.dart';
import 'package:howabout_coffee/app/core/extensions/size_extensions.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/core/ui/styles/text_styles.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/modules/wallet/state/wallet_state.dart';
import 'package:howabout_coffee/app/modules/wallet/wallet_controller.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class WalletPage extends StatefulWidget {
  final ClientModel? client;
  const WalletPage({Key? key, this.client}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends BaseState<WalletPage, WalletController> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletController, WalletState>(
      listener: (context, state) {
        state.status.matchAny(
          any: (() => hideLoader()),
          loading: (() => showLoader()),
          error: () {
            hideLoader();
            showError(state.errorMessage ?? ' Erro');
          },
        );
      },
      buildWhen: ((previous, current) => current.status.matchAny(
            any: (() => false),
            initial: (() => true),
            loaded: (() => true),
            clientLoaded: (() => true),
          )),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'wallet.description'.translate,
                      style: context.textStyles.textTitle.copyWith(color: ColorsApp.instance.fontColor), //TextStyle(color: ColorsApp.instance.fontColor, fontSize: context.textStyles.textTitle, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        await controller.refreshUser();
                      },
                      icon: Icon(Icons.refresh, color: ColorsApp.instance.fontColor)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 20, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "wallet.id".translate,
                      style: context.textStyles.textMedium.copyWith(color: ColorsApp.instance.fontColor),
                    ),
                    Text(
                      state.client?.id ?? '',
                      style: context.textStyles.textMedium.copyWith(color: ColorsApp.instance.fontColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 10),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "wallet.ballance".translate,
                          style: context.textStyles.textMedium.copyWith(color: ColorsApp.instance.fontColor, fontSize: 18),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Text(
                                context.read<CompanyController>().company?.moneySymbol ?? r'$',
                                style: TextStyle(color: ColorsApp.instance.fontColor, fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Text(
                              state.client?.totalCredit?.toStringAsFixed(2) ?? '',
                              style: context.textStyles.textBold.copyWith(color: ColorsApp.instance.fontColor, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: PrettyQr(
                  elementColor: ColorsApp.instance.fontColor,
                  image: const AssetImage('assets/images/logo_coffee_transparente.png'),
                  typeNumber: 5,
                  size: context.screenWidth * .6,
                  data: state.client?.id ?? '',
                  errorCorrectLevel: QrErrorCorrectLevel.M,
                  roundEdges: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
