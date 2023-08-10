import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/models/direct_sale.dart';

abstract class DirectsaleService {
  Future<List<DirectSale>?> getDirectSales({required ClientModel client, bool? used});
}
