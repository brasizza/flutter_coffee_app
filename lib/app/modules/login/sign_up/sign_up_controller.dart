import 'package:bloc/bloc.dart';
import 'package:howabout_coffee/app/data/exceptions/username_in_use_exception.dart';
import 'package:howabout_coffee/app/data/exceptions/weak_password_exception.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/login/state/login_state.dart';

class SignUpController extends Cubit<LoginState> {
  final AuthService _authService;
  final UserService _userService;
  SignUpController({required AuthService auth, required UserService userService})
      : _authService = auth,
        _userService = userService,
        super(const LoginState.initial());

  Future<bool> signUp({required String name, required String email, required String password}) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final user = await _authService.signUp(email: email, password: password, name: name);
      if (user != null) {
        final client = ClientModel.fromFirebase(user).copyWith(password: password);
        await _userService.save(client);
        await _userService.login(client);
        return true;
      }
    } on WeakPasswordException catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), status: LoginStatus.error));
    } on EmailInUseException catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), status: LoginStatus.error));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Erro ao efetuar o cadatro', status: LoginStatus.error));
    }
    return false;

    // throw Exception('AAA');
  }
}
