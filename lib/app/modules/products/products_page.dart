import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/data/models/category_model.dart';
import 'package:howabout_coffee/app/modules/home/widgets/coffee_card.dart';
import 'package:howabout_coffee/app/modules/products/products_controller.dart';
import 'package:howabout_coffee/app/modules/products/state/product_state.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends BaseState<ProductsPage, ProductsController> {
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
            )),
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 30,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    itemBuilder: (_, index) {
                      final CategoryModel category = state.categories[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: (category == state.categorySelected) ? ColorsApp.instance.primary : Colors.transparent, width: 2),
                            ),
                            onPressed: () {
                              controller.changeCategory(category);
                            },
                            child: Text(category.title)),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CoffeeCard(products: state.products.where((product) => product.category.toDouble() == state.categorySelected?.id.toDouble()).toList()),
              ),
            ],
          );
        });
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:howabout_coffee/app/data/models/category.dart';
// import 'package:howabout_coffee/app/modules/home/widgets/coffee_card.dart';
// import 'package:howabout_coffee/app/modules/products/products_controller.dart';

// class ProductsPage extends GetView<ProductsController> {
//   const ProductsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return controller.obx((productDTO) {
//       return Column(
//         children: [
//           SizedBox(
//             height: 30,
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: productDTO?.categories?.length ?? 0,
//                 itemBuilder: (_, index) {
//                   final Category category = productDTO!.categories![index];
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 4),
//                     child: OutlinedButton(
//                         style: OutlinedButton.styleFrom(
//                           side: BorderSide(color: (category == productDTO.categorySelected) ? context.theme.primaryColor : Colors.transparent, width: 2),
//                         ),
//                         onPressed: () {
//                           controller.changeCategory(category);
//                         },
//                         child: Text(category.title)),
//                   );
//                 }),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: CoffeeCard(products: productDTO?.products?.where((product) => product.category.toDouble() == productDTO.categorySelected?.id.toDouble()).toList()),
//           ),
//         ],
//       );
//     });
//   }
// }
