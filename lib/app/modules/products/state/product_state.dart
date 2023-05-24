// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:howabout_coffee/app/data/models/category_model.dart';
import 'package:howabout_coffee/app/data/models/product_model.dart';
import 'package:match/match.dart';

part 'product_state.g.dart';

@match
enum ProductStatus { initial, loading, loaded, error }

class ProductState extends Equatable {
  final ProductStatus status;
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  final CategoryModel? categorySelected;
  final String? errorMessage;

  const ProductState({required this.status, this.categories = const [], this.errorMessage, this.products = const [], this.categorySelected});

  const ProductState.initial()
      : status = ProductStatus.initial,
        errorMessage = '',
        categorySelected = null,
        products = const [],
        categories = const [];

  @override
  List<Object?> get props => [status, products, categories, categorySelected];

  ProductState copyWith({
    ProductStatus? status,
    List<CategoryModel>? categories,
    List<ProductModel>? products,
    CategoryModel? categorySelected,
    String? errorMessage,
  }) {
    return ProductState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      categorySelected: categorySelected ?? this.categorySelected,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
