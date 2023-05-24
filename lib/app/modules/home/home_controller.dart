import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/home/state/home_state.dart';
import 'package:howabout_coffee/app/modules/products/products_controller.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsController _productsController;
  final UserService _userService;
  HomeController({required ProductsController productsController, required UserService userService})
      : _productsController = productsController,
        _userService = userService,
        super(const HomeState.initial());

  addUser() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final client = await _userService.getUser();
      if (client != null) {
        emit(state.copyWith(status: HomeStatus.clientLoaded, client: client));
      } else {
        emit(state.copyWith(status: HomeStatus.error, errorMessage: 'Falha ao carregar o cliente'));
      }
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error, errorMessage: 'Falha ao carregar o cliente'));
    }
  }
}
