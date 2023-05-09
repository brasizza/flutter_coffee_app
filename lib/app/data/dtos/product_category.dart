// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/data/models/category.dart';
import 'package:howabout_coffee/app/data/models/product.dart';

class ProductCategoryDTO {
  final List<Category>? categories;
  final List<Product>? products;
  Category? categorySelected;
  ProductCategoryDTO({this.categories, this.products, this.categorySelected});

  @override
  String toString() => 'ProductCategoryDTO(categories: $categories, products: $products)';

  ProductCategoryDTO copyWith({
    List<Category>? categories,
    List<Product>? products,
    Category? categorySelected,
  }) {
    return ProductCategoryDTO(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      categorySelected: categorySelected ?? this.categorySelected,
    );
  }
}
