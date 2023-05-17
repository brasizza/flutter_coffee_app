import 'package:howabout_coffee/app/data/models/promotion.dart';

abstract class PresentationService {
  Future<List<Promotion>?> getPromotion();
}
