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
      final favorites = await _userService.getFavoriteUser(client);

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


// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:get/get.dart';
// import 'package:howabout_coffee/app/data/dtos/product_category.dart';
// import 'package:howabout_coffee/app/data/models/category.dart';
// import 'package:howabout_coffee/app/data/services/categoies/categories_service.dart';
// import 'package:howabout_coffee/app/data/services/products/products_service.dart';

// class ProductsController extends GetxController with StateMixin<ProductCategoryDTO> {
//   final CategoriesService _categories;
//   final ProductsService _products;
//   ProductsController({
//     required CategoriesService categoriesService,
//     required ProductsService productsService,
//   })  : _categories = categoriesService,
//         _products = productsService;

//   final text = 'Marcus'.obs;
//   late final ProductCategoryDTO productCategoryDTO;
//   @override
//   void onReady() async {
//     super.onReady();

//     final listCategories = await _categories.getAll();
//     final listProducts = await _products.getAll();

//     productCategoryDTO = ProductCategoryDTO(
//       categories: listCategories,
//       products: listProducts,
//       categorySelected: listCategories?.first,
//     );
//     change(productCategoryDTO, status: RxStatus.success());
//   }

//   void changeCategory(Category category) {
//     change(productCategoryDTO.copyWith(categorySelected: category), status: RxStatus.success());
//   }
// }
