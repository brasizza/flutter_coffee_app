import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/global/translation/app_translation.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/modules/home/widgets/coffee_card.dart';
import 'package:howabout_coffee/app/modules/products/products_controller.dart';
import 'package:howabout_coffee/app/modules/products/state/product_state.dart';

class ProductList extends StatefulWidget {
  final AppTranslation translation;
  const ProductList({Key? key, required this.translation}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends BaseState<ProductList, ProductsController> {
  final ScrollController gridController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsController, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        final products = state.products.where((product) => product.category.toDouble() == state.categorySelected?.id.toDouble()).toList();
        return GridView.builder(
          controller: gridController,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.9),
          itemBuilder: (context, index) {
            final product = products[index];
            return CoffeeCard(product: product, translation: widget.translation);
          },
          itemCount: products.length,
        );
      },
    );
  }
}
