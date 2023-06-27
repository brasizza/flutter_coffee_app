// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/data/services/favorite/favorite_service.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/favorite/state/favorite_state.dart';

class FavoriteController extends Cubit<FavoriteState> {
  final FavoriteService _service;
  final UserService _userService;
  FavoriteController({required FavoriteService service, required UserService userService})
      : _service = service,
        _userService = userService,
        super(const FavoriteState.initial());

  Future<void> getFavorites() async {
    emit(state.copyWith(status: FavoriteStatus.loading));
    try {
      final ids = await _userService.getFavoriteUser(_userService.currentUser);
      final products = await _service.getFavorites(ids: ids);

      emit(state.copyWith(status: FavoriteStatus.loaded, products: products));
    } catch (e) {
      emit(state.copyWith(status: FavoriteStatus.error, errorMessage: 'error.favorites'.translate));
    }
  }
}
