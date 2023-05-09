import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:howabout_coffee/app/data/models/category.dart';
import 'package:howabout_coffee/app/modules/home/widgets/coffee_card.dart';
import 'package:howabout_coffee/app/modules/products/products_controller.dart';

class ProductsPage extends GetView<ProductsController> {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((productDTO) {
      return Column(
        children: [
          SizedBox(
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productDTO?.categories?.length ?? 0,
                itemBuilder: (_, index) {
                  final Category category = productDTO!.categories![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.changeCategory(category);
                        },
                        child: Text(category.title)),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CoffeeCard(products: productDTO?.products?.where((product) => product.category.toDouble() == productDTO.categorySelected?.id.toDouble()).toList()),
          ),
        ],
      );
    });
  }
}
