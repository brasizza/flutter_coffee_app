import '../../models/category.dart';

abstract class CategoriesService {
  Future<List<Category>?> getAll();
}
