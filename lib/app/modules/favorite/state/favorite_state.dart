// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:howabout_coffee/app/data/models/product_model.dart';
import 'package:match/match.dart';

part 'favorite_state.g.dart';

@match
enum FavoriteStatus { initial, loading, loaded, error }

class FavoriteState extends Equatable {
  final List<ProductModel> products;
  final String? errorMessage;
  final FavoriteStatus status;
  const FavoriteState({
    required this.products,
    this.errorMessage,
    required this.status,
  });

  @override
  List<Object?> get props => [products, errorMessage, status];

  const FavoriteState.initial()
      : status = FavoriteStatus.initial,
        products = const [],
        errorMessage = '';

  FavoriteState copyWith({
    List<ProductModel>? products,
    String? errorMessage,
    FavoriteStatus? status,
  }) {
    return FavoriteState(
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
}
