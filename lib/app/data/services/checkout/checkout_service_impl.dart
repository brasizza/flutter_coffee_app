// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/models/transaction_model.dart';
import 'package:howabout_coffee/app/data/repositories/checkout/checkout_repository.dart';

import './checkout_service.dart';

class CheckoutServiceImpl implements CheckoutService {
  final CheckoutRepository _repository;
  CheckoutServiceImpl({
    required CheckoutRepository repository,
  }) : _repository = repository;

  @override
  Future<bool> saveTransaction({required TransactionModel transaction, required ClientModel client}) async {
    return await _repository.saveTransaction(transaction: transaction, client: client);
  }
}
