// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:howabout_coffee/app/data/dto/transaction_model.dart';
import 'package:match/match.dart';
import 'package:uuid/uuid.dart';

part 'checkout_state.g.dart';

@match
enum CheckoutStatus { initial, loading, loaded, error, itemAdd, itemRemoved, modifyItem, refresh, errorRange }

class CheckoutState extends Equatable {
  final String? errorMessage;
  final CheckoutStatus status;

  final TransactionModel transaction;
  const CheckoutState({this.errorMessage, required this.status, required this.transaction});

  CheckoutState.initial()
      : status = CheckoutStatus.initial,
        transaction = TransactionModel(transactionId: const Uuid().v4(), products: [], totalItems: 0, totalTransaction: 0),
        errorMessage = '';

  @override
  List<Object?> get props => [status, transaction, errorMessage];

  CheckoutState copyWith({
    String? errorMessage,
    CheckoutStatus? status,
    TransactionModel? transaction,
  }) {
    return CheckoutState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      transaction: transaction ?? this.transaction,
    );
  }
}
