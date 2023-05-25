import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/global/translation/app_translation.dart';
import 'package:howabout_coffee/app/data/models/category_model.dart';
import 'package:howabout_coffee/app/modules/products/products_controller.dart';

import '../../../core/ui/styles/color_app.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final CategoryModel? selected;
  final ProductsController controller;

  const CategoryItem({Key? key, required this.category, required this.controller, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = '';
    switch (AppTranslation.currentLocale) {
      case 'pt':
        title = category.titlePT;
        break;

      case 'es':
        title = category.titleES;
        break;

      case 'en':
        title = category.titleEN;
        break;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            side: BorderSide(color: (category == selected) ? ColorsApp.instance.primary : Colors.transparent, width: 2),
          ),
          onPressed: () {
            controller.changeCategory(category);
          },
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          )),
    );
  }
}
