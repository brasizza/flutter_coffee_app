import 'package:bloc/bloc.dart';
import 'package:howabout_coffee/app/core/exceptions/b4app_exception.dart';
import 'package:howabout_coffee/app/core/exceptions/user_not_found_exception.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';
import 'package:howabout_coffee/app/modules/login/state/login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;

  LoginController({
    required AuthService authService,
  })  : _authService = authService,
        super(const LoginState.initial());

  Future<bool> loginUser({required String email, required String password}) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await _authService.signIn(email: email, password: password);
      return true;
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.error, errorMessage: e.toString()));
      return false;
    }
  }

  Future<void> forgotPassword({required String email}) async {
    if (email.isEmpty) {
      emit(state.copyWith(status: LoginStatus.emptyEmail));
      emit(state.copyWith(status: LoginStatus.initial));
    } else {
      try {
        final resend = await _authService.forgotPassword(email: email);
        if (resend) {
          emit(state.copyWith(status: LoginStatus.resendPassword));
          emit(state.copyWith(status: LoginStatus.initial));
        }
      } on UserNotFoundException catch (e) {
        emit(state.copyWith(status: LoginStatus.error, errorMessage: e.toString()));
      } on Back4AppException catch (e) {
        emit(state.copyWith(status: LoginStatus.error, errorMessage: e.toString()));
      } catch (e) {
        emit(state.copyWith(status: LoginStatus.error, errorMessage: 'Falha ao reenviar a senha'));
      }
    }
  }
}
