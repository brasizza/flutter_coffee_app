import 'package:bloc/bloc.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';
import 'package:howabout_coffee/app/modules/login/state/login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;

  LoginController({required AuthService authService})
      : _authService = authService,
        super(const LoginState.initial());

  Future<void> loginUser({required String email, required String password}) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await _authService.signIn(email: email, password: password);
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.error, errorMessage: e.toString()));

      // TODO
    }
  }
}
