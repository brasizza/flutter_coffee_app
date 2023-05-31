import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/home/state/home_state.dart';

class HomeController extends Cubit<HomeState> {
  final UserService _userService;
  HomeController({required UserService userService})
      : _userService = userService,
        super(const HomeState.initial());

  addUser({bool refresh = true}) async {
    if (refresh == true) {
      emit(state.copyWith(status: HomeStatus.loading));
    } else {
      emit(state.copyWith(status: HomeStatus.initial));
    }
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

  refreshUser(ClientModel? client) {
    if (client != null) {
      emit(state.copyWith(status: HomeStatus.initial));
      emit(state.copyWith(status: HomeStatus.clientLoaded, client: client));
    } else {
      addUser(refresh: false);
    }
  }
}
