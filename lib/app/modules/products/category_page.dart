import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/global/translation/app_translation.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/data/models/category_model.dart';
import 'package:howabout_coffee/app/modules/products/components/category_item.dart';
import 'package:howabout_coffee/app/modules/products/products_controller.dart';
import 'package:howabout_coffee/app/modules/products/state/product_state.dart';

class CategoryPage extends StatefulWidget {
  final AppTranslation translation;
  const CategoryPage({
    Key? key,
    required this.translation,
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
                    translate: widget.translation,
                  );
                }),
          );
        });
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:howabout_coffee/app/data/models/category.dart';
// import 'package:howabout_coffee/app/modules/home/widgets/coffee_card.dart';
// import 'package:howabout_coffee/app/modules/products/products_controller.dart';

// class CategoryPage extends GetView<ProductsController> {
//   const CategoryPage({super.key});

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
