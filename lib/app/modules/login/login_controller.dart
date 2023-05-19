import 'package:bloc/bloc.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/login/state/login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;
  final UserService _userService;

  LoginController({required AuthService authService, required UserService userService})
      : _authService = authService,
        _userService = userService,
        super(const LoginState.initial());

  Future<bool> loginUser({required String email, required String password}) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final user = await _authService.signIn(email: email, password: password);
      if (user != null) {
        return await _userService.auth(ClientModel.fromFirebase(user).copyWith(password: password));
      }
      emit(state.copyWith(status: LoginStatus.error, errorMessage: 'Falha autenticacao'));
      return false;
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.error, errorMessage: e.toString()));
      return false;
    }
  }
}
