import 'package:howabout_coffee/app/data/models/promotion_model.dart';
import 'package:howabout_coffee/app/data/repositories/presentation/presentation_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class PresentationRepositoryB4appImpl implements PresentationRepository {
  @override
  Future<List<PromotionModel>?> getPromotion() async {
    try {
      QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(ParseObject('Promotion'));
      final response = await query.query();
      if (!response.success) {
        return null;
      }
      return (response.results as List).map((e) => PromotionModel.fromParse(e)).toList();
    } catch (e) {
      return null;
    }
  }
}
