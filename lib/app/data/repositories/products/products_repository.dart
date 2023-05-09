import 'package:howabout_coffee/app/data/models/product.dart';

abstract class ProductsRepository {
  Future<List<Product>?> getAll();
}
