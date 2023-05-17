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
