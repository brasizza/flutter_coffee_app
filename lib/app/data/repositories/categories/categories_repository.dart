import '../../models/category_model.dart';

abstract class CategoriesRepository {
  Future<List<CategoryModel>?> getAll();
}
