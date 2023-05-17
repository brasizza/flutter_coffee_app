import 'package:howabout_coffee/app/data/models/promotion_model.dart';

abstract class PresentationService {
  Future<List<PromotionModel>?> getPromotion();
}
