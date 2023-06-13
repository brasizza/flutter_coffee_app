import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/models/transaction_model.dart';

abstract class CheckoutService {
  Future saveTransaction({required TransactionModel transaction, required ClientModel client});
}
