// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/core/rest/rest_client.dart';
import 'package:howabout_coffee/app/data/models/promotion_model.dart';
import 'package:howabout_coffee/app/data/repositories/presentation/presentation_repository.dart';

class PresentationRepositoryRestImpl implements PresentationRepository {
  final RestClient _rest;
  PresentationRepositoryRestImpl({
    required RestClient rest,
  }) : _rest = rest;

  @override
  Future<List<PromotionModel>?> getPromotion() async {
    final request = await _rest.unauth().get('/promotions');

    if (request.statusCode != 200) {
      return null;
    } else {
      return (request.data as List).map((p) => PromotionModel.fromMap(p)).toList();
    }
  }
}
