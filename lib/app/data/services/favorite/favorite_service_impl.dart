import 'package:howabout_coffee/app/data/models/product_model.dart';
import 'package:howabout_coffee/app/data/repositories/favorites/favorite_repository.dart';

import './favorite_service.dart';

class FavoriteServiceImpl implements FavoriteService {
  final FavoriteRepository _repository;
  FavoriteServiceImpl({required FavoriteRepository repository}) : _repository = repository;

  @override
  Future<List<ProductModel>?> getFavorites({List<int>? ids}) async {
    return await _repository.getFavorites(ids: ids);
  }
}
