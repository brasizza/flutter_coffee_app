import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/data/models/product_model.dart';
import 'package:howabout_coffee/app/data/models/product_model_checkout.dart';
import 'package:howabout_coffee/app/modules/checkout/state/checkout_state.dart';

class CheckoutController extends Cubit<CheckoutState> {
  CheckoutController() : super(CheckoutState.initial());

  Future<void> addItem(ProductModel product, int quantity) async {
    emit(state.copyWith(status: CheckoutStatus.loading));
    final productCheckout = ProductModelCheckout.fromMap(product.toMap()).copyWith(quantity: quantity);
    final transaction = state.transaction;
    transaction.products.add(productCheckout);
    emit(state.copyWith(status: CheckoutStatus.itemAdd, transaction: transaction));
    await Future.delayed(const Duration(milliseconds: 300));
    refresh();
  }

  void refresh() {
    final totalItems = state.transaction.products.fold(0, (previousValue, element) => previousValue + (element.quantity));
    final totalValue = state.transaction.products.fold(0.0, (previousValue, element) => previousValue + (element.quantity * element.price));
    emit(state.copyWith(status: CheckoutStatus.refresh, transaction: state.transaction.copyWith(totalItems: totalItems, totalTransaction: totalValue)));
  }

  void removeItem(index) async {
    // if (state.transaction.products.contains(product)) {
    final transaction = state.transaction;
    transaction.products.removeAt(index);
    emit(state.copyWith(status: CheckoutStatus.itemRemoved, transaction: transaction));
    await Future.delayed(const Duration(milliseconds: 300));

    refresh();
    // }
  }

  void clear() {
    emit(CheckoutState.initial());
    refresh();
  }

  void updateProduct(ProductModelCheckout product, int quantity, int index) {
    state.transaction.products[index] = state.transaction.products[index].copyWith(quantity: quantity);
    emit(state.copyWith(status: CheckoutStatus.modifyItem));
    refresh();
  }
}
