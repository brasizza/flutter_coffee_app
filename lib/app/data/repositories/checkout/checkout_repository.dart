import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/models/transaction_model.dart';

abstract class CheckoutRepository {
  Future<bool> saveTransaction({required TransactionModel transaction, required ClientModel client});
}
