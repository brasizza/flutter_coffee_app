import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/data/models/client.dart';
import 'package:howabout_coffee/app/modules/home/state/home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(const HomeState.initial());

  checkUser(Client? client) {
    if (client != null) {
      emit(state.copyWith(status: HomeStatus.clientLoaded, client: client));
    }
  }
}
