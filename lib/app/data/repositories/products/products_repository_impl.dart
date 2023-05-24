// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/data/models/product_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/exceptions/b4app_exception.dart';
import 'products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<List<ProductModel>?> getAll() async {
    QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(ParseObject(ProductModel.className));
    query.whereEqualTo('status', true);
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
