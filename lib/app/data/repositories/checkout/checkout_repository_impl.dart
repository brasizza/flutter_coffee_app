import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/models/transaction_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import './checkout_repository.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  @override
  Future<bool> saveTransaction({required TransactionModel transaction, required ClientModel client}) async {
    final parseUser = await ParseUser.currentUser() as ParseUser?;
    final parseObject = TransactionModel.toParse(transaction);
    parseObject.set('user', parseUser);
    final result = await parseObject.save();
    if (result.success) {
      return true;
    } else {
      return false;
    }
  }
}
