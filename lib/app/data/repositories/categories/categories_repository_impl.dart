// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/exceptions/b4app_exception.dart';
import '../../models/category_model.dart';
import 'categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  // final RestClient _rest;

  @override
  Future<List<CategoryModel>?> getAll() async {
    QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(ParseObject(CategoryModel.className));
    query.whereEqualTo('status', true);
    query.orderByAscending('order');

    final response = await query.query();

    if (!response.success) {
      throw Back4AppException(response.error?.message ?? '');
    } else {
      if (response.count == 0) {
        return null;
      }
      return (response.results as List<ParseObject>).map((p) => CategoryModel.fromParse(p)).toList();
    }
  }
}
