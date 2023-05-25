import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/data/models/category_model.dart';
import 'package:howabout_coffee/app/modules/products/components/category_item.dart';
import 'package:howabout_coffee/app/modules/products/products_controller.dart';
import 'package:howabout_coffee/app/modules/products/state/product_state.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends BaseState<CategoryPage, ProductsController> {
  @override
  void onReady() {
    super.onReady();
    controller.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsController, ProductState>(
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
              changeCategory: (() => true),
            )),
        builder: (context, state) {
          return SizedBox(
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (_, index) {
                  final CategoryModel category = state.categories[index];
                  return CategoryItem(
                    category: category,
                    selected: state.categorySelected,
                    controller: controller,
                  );
                }),
          );
        });
  }
}
