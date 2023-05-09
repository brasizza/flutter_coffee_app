// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/core/rest/rest_client.dart';

import '../../models/category.dart';
import 'categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final RestClient _rest;
  CategoriesRepositoryImpl({
    required RestClient rest,
  }) : _rest = rest;

  @override
  Future<List<Category>?> getAll() async {
    final response = await _rest.get("/categories");
    if (response.statusCode != 200) {
      return null;
    } else {
      return ((response.data as List).map((e) => Category.fromMap(e))).toList();
    }
  }
}
