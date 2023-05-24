import 'package:bloc/bloc.dart';
import 'package:howabout_coffee/app/core/exceptions/sign_up_exception.dart';
import 'package:howabout_coffee/app/core/exceptions/username_in_use_exception.dart';
import 'package:howabout_coffee/app/core/exceptions/weak_password_exception.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';
import 'package:howabout_coffee/app/modules/login/state/login_state.dart';

class SignUpController extends Cubit<LoginState> {
  final AuthService _authService;
  SignUpController({
    required AuthService auth,
  })  : _authService = auth,
        super(const LoginState.initial());

  Future<bool> signUp({required String email, required String password}) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await _authService.signUp(email: email, password: password);
    } on WeakPasswordException catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), status: LoginStatus.error));
    } on EmailInUseException catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), status: LoginStatus.error));
    } on SignUpException catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), status: LoginStatus.error));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Erro ao efetuar o cadatro', status: LoginStatus.error));
    }
    return false;

    // throw Exception('AAA');
  }
}
