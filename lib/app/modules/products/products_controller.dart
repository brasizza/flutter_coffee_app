import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/data/models/category_model.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/services/categories/categories_service.dart';
import 'package:howabout_coffee/app/data/services/products/products_service.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/products/state/product_state.dart';

class ProductsController extends Cubit<ProductState> {
  final CategoriesService _categories;
  final ProductsService _products;
  final UserService _userService;

  ProductsController({
    required CategoriesService categoriesService,
    required UserService userService,
    required ProductsService productsService,
  })  : _categories = categoriesService,
        _products = productsService,
        _userService = userService,
        super(const ProductState.initial());

  void getProducts({ClientModel? client}) async {
    emit(
      state.copyWith(status: ProductStatus.loading),
    );
    try {
      final listCategories = await _categories.getAll();
      final listProducts = await _products.getAll();
      final favorites = (client?.anonymous == false) ? null : await _userService.getFavoriteUser(client);

      emit(
        state.copyWith(
          categories: listCategories,
          products: listProducts,
          status: ProductStatus.loaded,
          favorites: favorites,
          categorySelected: ((listCategories?.length ?? 0) > 1 ? (listCategories?.first) : null),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.error, errorMessage: ' Falha ao recuperar os produtos!'));
    }
  }

  void changeCategory(CategoryModel category) {
    emit(state.copyWith(categorySelected: category, status: ProductStatus.changeCategory));
  }

  void changeFavoriteProduct({required int productId, required ClientModel? client}) async {
    if (client != null) {
      final favorites = await _userService.manageFavorites(client, productId);
      emit(state.copyWith(status: ProductStatus.loaded));
      emit(state.copyWith(
        favorites: favorites,
        status: ProductStatus.unfavoriteProduct,
      ));
    }
  }
}
