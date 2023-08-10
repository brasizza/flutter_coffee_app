// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:howabout_coffee/app/data/models/direct_sale.dart';
import 'package:match/match.dart';

part 'direct_sale_state.g.dart';

@match
enum DirectSaleStatus { initial, loading, loaded, error }

class DirectSaleState extends Equatable {
  final List<DirectSale> sales;
  final String? errorMessage;
  final DirectSaleStatus status;
  const DirectSaleState({
    required this.sales,
    this.errorMessage,
    required this.status,
  });

  const DirectSaleState.initial()
      : status = DirectSaleStatus.initial,
        sales = const [],
        errorMessage = '';

  @override
  List<Object?> get props => [sales, errorMessage, status];

  DirectSaleState copyWith({
    List<DirectSale>? sales,
    String? errorMessage,
    DirectSaleStatus? status,
  }) {
    return DirectSaleState(
      sales: sales ?? this.sales,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
}
