import '../../models/category.dart';

abstract class CategoriesRepository {
  Future<List<Category>?> getAll();
}
