// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/models/direct_sale.dart';
import 'package:howabout_coffee/app/data/repositories/direct_sales/direct_sale_repository.dart';

import 'directsale_service.dart';

class DirectsaleServiceImpl implements DirectsaleService {
  final DirectSaleRepository _repository;
  DirectsaleServiceImpl({
    required DirectSaleRepository repository,
  }) : _repository = repository;

  @override
  Future<List<DirectSale>?> getDirectSales({required ClientModel client, bool? used}) async {
    return await _repository.getDirectSales(client: client, used: used);
  }
}
