import 'package:cli/consts.dart';
import 'package:dio/dio.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class CategoriesController {
  final Dio dio;
  CategoriesController({
    required this.dio,
  });

  Future<bool?> getAll() async {
    final vendusKey = Consts.vendusKey;
    final Map<int, dynamic> categories = {};
    final urlCategory = '${Consts.urlVendus}/products/categories?api_key=$vendusKey&per_page=400';

    final response = await dio.get(urlCategory);
    if (response.statusCode != 200) {
      return null;
    }
    for (var item in response.data as List) {
      categories[item['id']] = item;
    }

    final keys = categories.keys.toList();

    var apiResponse = await ParseObject('Category').getAll();
    if (apiResponse.success) {
      if (apiResponse.count == 0) {
        for (var key in keys) {
          final arrCateg = (categories[key]);
          final category = ParseObject('Category');
          category.set('category_id', arrCateg['id']);
          category.set('status', arrCateg['status'] == 'on' ? true : false);
          category.set('order', arrCateg['order']);
          category.set('title_pt', arrCateg['title']);
          category.set('title_en', arrCateg['title']);
          category.set('title_es', arrCateg['title']);
          await category.save();

          // categories.add(category);
        }
      } else {
        final List<int> keysCategory = [];
        for (ParseObject categoryObject in apiResponse.result) {
          keysCategory.add(categoryObject.get('category_id'));
        }
        final toIsert = [...keys];

        toIsert.removeWhere((element) => keysCategory.contains(element));
        if (toIsert.isNotEmpty) {
          for (var key in toIsert) {
            final arrCateg = (categories[key]);
            final category = ParseObject('Category');
            category.set('category_id', arrCateg['id']);
            category.set('status', arrCateg['status'] == 'on' ? true : false);
            category.set('order', arrCateg['order']);
            category.set('title_pt', arrCateg['title']);
            category.set('title_en', arrCateg['title']);
            category.set('title_es', arrCateg['title']);
            await category.save();
          }
        }
        // keys.removeWhere((element) => toIsert.contains(element));
      }
    }

    return true;
  }
}
