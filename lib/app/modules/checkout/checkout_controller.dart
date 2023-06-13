import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/company/company_controller.dart';
import 'package:howabout_coffee/app/core/config/base_config.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/location/location_service.dart';
import 'package:howabout_coffee/app/data/models/product_model.dart';
import 'package:howabout_coffee/app/data/models/product_model_checkout.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/checkout/state/checkout_state.dart';

class CheckoutController extends Cubit<CheckoutState> {
  final UserService _userService;
  final CompanyController _companyController;
  final LocationService _locationService;
  final Env _env;
  CheckoutController({required UserService userService, required LocationService locationService, required CompanyController companyController, required Env env})
      : _userService = userService,
        _companyController = companyController,
        _locationService = locationService,
        _env = env,
        super(CheckoutState.initial());

  Future<void> addItem(ProductModel product, int quantity) async {
    emit(state.copyWith(status: CheckoutStatus.loading));
    final productCheckout = ProductModelCheckout.fromMap(product.toMap()).copyWith(quantity: quantity);
    final transaction = state.transaction;

    final findProduct = transaction.products.indexWhere((productList) => productList.id == product.id);
    if (findProduct == -1) {
      transaction.products.add(productCheckout);
    } else {
      final productList = transaction.products[findProduct];

      int quantityToChange = productList.quantity + quantity;

      transaction.products[findProduct] = transaction.products[findProduct].copyWith(quantity: quantityToChange);
    }

    // transaction.products.add(productCheckout);
    emit(state.copyWith(status: CheckoutStatus.itemAdd, transaction: transaction));
    await Future.delayed(const Duration(milliseconds: 100));
    refresh();
  }

  void refresh() {
    final totalItems = state.transaction.products.fold(0, (previousValue, element) => previousValue + (element.quantity));
    final totalValue = state.transaction.products.fold(0.0, (previousValue, element) => previousValue + (element.quantity * element.price));
    emit(state.copyWith(status: CheckoutStatus.refresh, transaction: state.transaction.copyWith(totalItems: totalItems, totalTransaction: totalValue)));
  }

  void askToRemove(index) {
    emit(state.copyWith(status: CheckoutStatus.askToRemove, removedItem: state.transaction.products.elementAt(index)));
  }

  void askToClearAll() {
    emit(state.copyWith(status: CheckoutStatus.askToClearAll));
  }

  void removeItem(ProductModelCheckout product) async {
    final transaction = state.transaction;
    if (transaction.products.remove(product)) {
      emit(state.copyWith(status: CheckoutStatus.itemRemoved, transaction: transaction));
      await Future.delayed(const Duration(milliseconds: 300));
      refresh();
    } else {
      emit(state.copyWith(status: CheckoutStatus.error, errorMessage: 'error.delete'.translate));
    }
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

  void validatePayment() async {
    await _locationService.init();
    final location = await _locationService.currentPosition();
    if (location == null) {
      emit(state.copyWith(errorMessage: 'error.location', status: CheckoutStatus.error));
    } else {
      final lat = _companyController.company?.lat ?? 0;
      final lng = _companyController.company?.lng ?? 0;
      final distance = _locationService.calculateDistance(lat, lng, location);
      final range = (_env['max_range']);

      if (distance > range) {
        emit(state.copyWith(errorMessage: 'error.range', status: CheckoutStatus.errorRange));
        emit(state.copyWith(status: CheckoutStatus.initial));
      }
    }
  }

  void cancelProcess() {
    emit(state.copyWith(status: CheckoutStatus.cancelProcess));
  }
}
