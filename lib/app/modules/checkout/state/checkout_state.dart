// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:howabout_coffee/app/data/models/product_model_checkout.dart';
import 'package:howabout_coffee/app/data/models/transaction_model.dart';
import 'package:match/match.dart';
import 'package:uuid/uuid.dart';

part 'checkout_state.g.dart';

@match
enum CheckoutStatus {
  initial,
  loading,
  loaded,
  error,
  itemAdd,
  itemRemoved,
  modifyItem,
  refresh,
  errorRange,
  askToRemove,
  askToClearAll,
  cancelProcess,
  askToProceedCheckout,
  proceedCheckout,
  checkoutFinished,
}

class CheckoutState extends Equatable {
  final String? errorMessage;
  final CheckoutStatus status;
  final ProductModelCheckout? removedItem;
  final TransactionModel transaction;
  const CheckoutState({this.errorMessage, required this.status, required this.transaction, this.removedItem});

  CheckoutState.initial()
      : status = CheckoutStatus.initial,
        removedItem = null,
        transaction = TransactionModel(transactionId: const Uuid().v4(), products: [], totalItems: 0, totalTransaction: 0),
        errorMessage = '';

  @override
  List<Object?> get props => [status, transaction, errorMessage, removedItem];

  CheckoutState copyWith({
    String? errorMessage,
    CheckoutStatus? status,
    ProductModelCheckout? removedItem,
    TransactionModel? transaction,
  }) {
    return CheckoutState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      removedItem: removedItem ?? this.removedItem,
      transaction: transaction ?? this.transaction,
    );
  }
}
