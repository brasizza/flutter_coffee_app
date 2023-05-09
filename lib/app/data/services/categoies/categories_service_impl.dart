// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/data/repositories/categories/categories_repository.dart';

import '../../models/category.dart';
import 'categories_service.dart';

class CategoriesServiceImpl implements CategoriesService {
  final CategoriesRepository _repository;
  CategoriesServiceImpl({
    required CategoriesRepository repository,
  }) : _repository = repository;

  @override
  Future<List<Category>?> getAll() {
    return _repository.getAll();
  }
}
