import '../../models/category_model.dart';

abstract class CategoriesService {
  Future<List<CategoryModel>?> getAll();
}
