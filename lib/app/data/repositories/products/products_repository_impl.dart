// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/core/rest/rest_client.dart';
import 'package:howabout_coffee/app/data/models/product.dart';

import 'products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final RestClient _rest;
  ProductsRepositoryImpl({
    required RestClient rest,
  }) : _rest = rest;

  @override
  Future<List<Product>?> getAll() async {
    final response = await _rest.get('/products');
    if (response.statusCode != 200) {
      return null;
    }

    return (response.data as List).map((e) => Product.fromMap(e)).toList();
  }
}
