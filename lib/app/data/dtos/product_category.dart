import 'package:howabout_coffee/app/data/models/category_model.dart';
import 'package:howabout_coffee/app/data/models/product_model.dart';

class ProductCategoryDTO {
  final List<CategoryModel>? categories;
  final List<ProductModel>? products;
  CategoryModel? categorySelected;
  ProductCategoryDTO({this.categories, this.products, this.categorySelected});

  @override
  String toString() => 'ProductCategoryDTO(categories: $categories, products: $products)';

  ProductCategoryDTO copyWith({
    List<CategoryModel>? categories,
    List<ProductModel>? products,
    CategoryModel? categorySelected,
  }) {
    return ProductCategoryDTO(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      categorySelected: categorySelected ?? this.categorySelected,
    );
  }
}
