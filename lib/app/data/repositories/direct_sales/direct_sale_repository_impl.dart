import 'package:howabout_coffee/app/core/exceptions/b4app_exception.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/models/direct_sale.dart';
import 'package:howabout_coffee/app/data/models/product_model_checkout.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import './direct_sale_repository.dart';

class DirectSaleRepositoryImpl implements DirectSaleRepository {
  @override
  Future<List<DirectSale>?> getDirectSales({required ClientModel client, bool? used}) async {
    final direct = <DirectSale>[];
    final QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(ParseObject(DirectSale.className));
    if (used != null) {
      query.whereEqualTo('used', used);
    }
    query.setLimit(1000000);
    query.orderByAscending('order');

    final response = await query.query();

    if (!response.success) {
      throw Back4AppException(response.error?.message ?? '');
    } else {
      if (response.count == 0) {
        return null;
      }
      for (var result in response.results!) {
        final parseResult = (result as ParseObject);

        final productResponse = await ParseObject('Product').getObject(parseResult.get('product')?.objectId);
        if (productResponse.success) {
          final ParseObject product = productResponse.result;
          // log(product.toString());

          direct.add(DirectSale(
            objectId: parseResult.objectId,
            product: ProductModelCheckout.fromParse(product),
            used: parseResult.get('used'),
          ));
        }
      }
    }

    return direct;
  }
}
