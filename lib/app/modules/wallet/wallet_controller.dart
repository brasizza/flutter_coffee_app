// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/wallet/state/wallet_state.dart';

class WalletController extends Cubit<WalletState> {
  final UserService _userService;
  WalletController({required UserService userService})
      : _userService = userService,
        super(const WalletState.initial());

  addUser(ClientModel? client) {
    emit(state.copyWith(status: WalletStatus.clientLoaded, client: client));
  }

  Future<ClientModel?> refreshUser() async {
    emit(state.copyWith(status: WalletStatus.loading));
    final client = await _userService.getUser();
    emit(state.copyWith(status: WalletStatus.clientLoaded, client: client));
    return client;
  }
}
