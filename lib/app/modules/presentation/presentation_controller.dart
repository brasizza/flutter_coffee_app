import 'package:bloc/bloc.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';
import 'package:howabout_coffee/app/data/services/presentation/presentation_service.dart';
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

  Future<bool> autoLogin({required AuthService authService}) async {
    final isLogged = await authService.isLogged();
    if (!isLogged) {
      return false;
    } else {
      return true;
    }
  }
}
