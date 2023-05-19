import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/home/state/home_state.dart';

class HomeController extends Cubit<HomeState> {
  final UserService _userService;
  HomeController({required UserService userService})
      : _userService = userService,
        super(const HomeState.initial());

  addUser() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final client = await _userService.getuser();
      if (client != null) {
        emit(state.copyWith(status: HomeStatus.clientLoaded, client: client));
      }
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error, errorMessage: 'Falha ao carregar o cliente'));
    }
  }
}
