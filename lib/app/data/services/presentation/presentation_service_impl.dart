// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/data/models/promotion.dart';
import 'package:howabout_coffee/app/data/repositories/presentation/presentation_repository.dart';

import './presentation_service.dart';

class PresentationServiceImpl implements PresentationService {
  final PresentationRepository _repository;
  PresentationServiceImpl({
    required PresentationRepository repository,
  }) : _repository = repository;
  @override
  Future<List<Promotion>?> getPromotion() async {
    return _repository.getPromotion();
  }
}
