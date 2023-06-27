import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/modules/checkout/widgets/empty_cart.dart';
import 'package:howabout_coffee/app/modules/favorite/favorite_controller.dart';
import 'package:howabout_coffee/app/modules/favorite/state/favorite_state.dart';
import 'package:howabout_coffee/app/modules/home/widgets/app_bottom_bar.dart';
import 'package:howabout_coffee/app/modules/home/widgets/coffee_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends BaseState<FavoritePage, FavoriteController> {
  @override
  void onReady() async {
    super.onReady();
    final nav = Navigator.of(context);
    await controller.getFavorites();
    nav.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('products.favorites'.translate),
      ),
      bottomNavigationBar: const AppBottomBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<FavoriteController, FavoriteState>(
            listener: (context, state) {
              state.status.matchAny(
                any: (() {}),
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
                )),
            builder: (context, state) {
              if (state.status == FavoriteStatus.loaded) {
                if (state.products.isEmpty) {
                  return EmptyCart(message: 'empty.favorites.message'.translate);
                }

                final products = state.products;

                return GridView.builder(
                  // controller: gridController,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.8),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return CoffeeCard(
                      productController: context.read(),
                      checkoutController: context.read(),
                      companyController: context.read(),
                      product: product,
                    );
                  },
                  itemCount: products.length,
                );
              }
              return EmptyCart(message: 'empty.favorites.message'.translate);
            }),
      ),
    );
  }
}
