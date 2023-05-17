import 'package:howabout_coffee/app/data/models/promotion.dart';

abstract class PresentationRepository {
  Future<List<Promotion>?> getPromotion();
}
