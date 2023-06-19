import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/modules/home/widgets/coffee_card.dart';
import 'package:howabout_coffee/app/modules/products/products_controller.dart';
import 'package:howabout_coffee/app/modules/products/state/product_state.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends BaseState<ProductPage, ProductsController> {
  final ScrollController gridController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsController, ProductState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () {},
          changeCategory: () {
            gridController.jumpTo(0);
          },
        );
      },
      builder: (context, state) {
        final products = state.products.where((product) => product.category.toDouble() == state.categorySelected?.id.toDouble()).toList();
        return GridView.builder(
          controller: gridController,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            final product = products[index];

            return CoffeeCard(
              productController: context.read(),
              companyController: context.read(),
              checkoutController: context.read(),
              favorite: (state.favorites.contains(product.id)),
              product: product,
            );
          },
          itemCount: products.length,
        );
      },
    );
  }
}
