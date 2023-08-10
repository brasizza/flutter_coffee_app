import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/services/direct_sale/directsale_service.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/direct_sale/state/direct_sale_state.dart';

class DirectSaleController extends Cubit<DirectSaleState> {
  final UserService _userService;
  final DirectsaleService _service;
  DirectSaleController({required DirectsaleService service, required UserService userService})
      : _service = service,
        _userService = userService,
        super(const DirectSaleState.initial());

  Future<void> getDirectSales({required ClientModel client, bool? used}) async {
    emit(state.copyWith(status: DirectSaleStatus.loading));
    final sales = await _service.getDirectSales(client: client, used: false);

    emit(state.copyWith(status: DirectSaleStatus.loaded, sales: sales));
  }
}
