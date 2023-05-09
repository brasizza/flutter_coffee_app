import 'package:howabout_coffee/app/data/models/product.dart';

abstract class ProductsService {
  Future<List<Product>?> getAll();
}
