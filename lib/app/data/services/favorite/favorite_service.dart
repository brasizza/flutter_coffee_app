import 'package:howabout_coffee/app/data/models/product_model.dart';

abstract class FavoriteService {
  Future<List<ProductModel>?> getFavorites({List<int>? ids});
}
