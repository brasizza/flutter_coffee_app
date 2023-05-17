import 'package:howabout_coffee/app/data/models/promotion_model.dart';

abstract class PresentationRepository {
  Future<List<PromotionModel>?> getPromotion();
}
