// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/data/models/product.dart';
import 'package:howabout_coffee/app/data/repositories/products/products_repository.dart';

import 'products_service.dart';

class ProductsServiceImpl implements ProductsService {
  final ProductsRepository _repository;
  ProductsServiceImpl({
    required ProductsRepository repository,
  }) : _repository = repository;

  @override
  Future<List<Product>?> getAll() async {
    return _repository.getAll();
  }
}
