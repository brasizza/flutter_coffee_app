import 'package:howabout_coffee/app/data/models/product_model.dart';

abstract class ProductsService {
  Future<List<ProductModel>?> getAll();
}
