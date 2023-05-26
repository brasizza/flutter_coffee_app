import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/modules/checkout/checkout_controller.dart';
import 'package:howabout_coffee/app/modules/checkout/checkout_page.dart';
import 'package:howabout_coffee/app/modules/checkout/state/checkout_state.dart';

import '../../../core/ui/styles/color_app.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends BaseState<AppBottomBar, CheckoutController> {
  bool _bottomSheetOpen = false;
  int bottomIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutController, CheckoutState>(
      listener: (context, state) {
        // state.status.matchAny(
        //   any: () {},
        //   refresh: () {
        //     if (state.transaction.totalItems == 0) {
        //       if (_bottomSheetOpen) {
        //         Navigator.of(context).pop();
        //       }
        //     }
        //   },
        // );
      },
      buildWhen: ((previous, current) => current.status.matchAny(
            any: (() => false),
            initial: (() => true),
            loaded: (() => true),
            itemAdd: (() => true),
            itemRemoved: (() => true),
            modifyItem: (() => true),
            refresh: (() => true),
          )),
      builder: (context, state) {
        return SizedBox(
          height: 60,
          child: BottomNavigationBar(
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(
                  icon: Badge(
                    isLabelVisible: (state.transaction.totalItems > 0),
                    offset: const Offset(10, -10),
                    largeSize: 15,
                    smallSize: 15,
                    label: Text(state.transaction.totalItems.toString()),
                    backgroundColor: (state.status == CheckoutStatus.itemAdd || state.status == CheckoutStatus.itemRemoved) ? ColorsApp.instance.secondary : ColorsApp.instance.primary,
                    child: const Icon(
                      Icons.shopping_bag,
                    ),
                  ),
                  label: ""),
            ],
            currentIndex: bottomIndex,
            onTap: (index) async {
              setState(() {
                bottomIndex = index;
              });
              if (index == 1) {
                _bottomSheetOpen = true;
                await showBottomSheet(
                    context: context,
                    builder: (_) {
                      return const CheckoutPage();
                    }).closed.whenComplete(() {
                  _bottomSheetOpen = false;

                  setState(() {
                    bottomIndex = 0;
                  });
                });
              } else {
                if (_bottomSheetOpen) {
                  _bottomSheetOpen = false;
                  Navigator.of(context).pop();
                }
              }
            },
          ),
        );
      },
    );
  }
}
