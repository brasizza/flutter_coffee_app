import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import './favorite_repository.dart';
import '../../../core/exceptions/b4app_exception.dart';
import '../../models/product_model.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  @override
  Future<List<ProductModel>?> getFavorites({List<int>? ids}) async {
    final QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(ParseObject(ProductModel.className));
    if (ids == null) {
      return null;
    }
    query.whereContainedIn('product_id', ids as List<dynamic>);
    query.setLimit(1000000);
    query.orderByAscending('order');

    final response = await query.query();

    if (!response.success) {
      throw Back4AppException(response.error?.message ?? '');
    } else {
      if (response.count == 0) {
        return null;
      }
      return (response.results as List<ParseObject>).map((p) => ProductModel.fromParse(p)).toList();
    }
  }
}
