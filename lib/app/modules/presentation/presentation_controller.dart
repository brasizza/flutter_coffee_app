import 'package:bloc/bloc.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';
import 'package:howabout_coffee/app/data/services/presentation/presentation_service.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/presentation/state/presentation_state.dart';

class PresentationController extends Cubit<PresentationState> {
  final PresentationService _service;
  PresentationController({required PresentationService service})
      : _service = service,
        super(const PresentationState.initial());

  Future<void> getPromotion() async {
    emit(state.copyWith(status: PresentationStatus.loading));
    try {
      final promotion = await _service.getPromotion();
      emit(state.copyWith(images: promotion, status: PresentationStatus.loaded));
    } on Exception catch (e) {
      emit(state.copyWith(images: [], status: PresentationStatus.error, errorMessage: e.toString()));
    }
  }

  Future<ClientModel?> autoLogin({required AuthService authService, required UserService userService}) async {
    emit(state.copyWith(status: PresentationStatus.loading));

    final isLogged = authService.isLogged();
    if (!isLogged) {
      emit(state.copyWith(status: PresentationStatus.loaded));
      return null;
    } else {
      final user = await userService.getuser();
      return user;
    }
  }
}
