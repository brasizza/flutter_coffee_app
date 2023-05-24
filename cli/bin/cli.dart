import 'package:cli/consts.dart';
import 'package:cli/products_controller.dart';
import 'package:dio/dio.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main(List<String> arguments) async {
  final Dio dio = Dio();

  await Parse().initialize(
    Consts.keyApplicationId,
    Consts.keyParseServerUrl,
    clientKey: Consts.keyClientKey,
    debug: true,
  );
  // final CategoriesController categoriesController = CategoriesController(dio: dio);
  // await categoriesController.getAll();

  final ProductsController productsController = ProductsController(dio: dio);
  await productsController.getAll();
}
