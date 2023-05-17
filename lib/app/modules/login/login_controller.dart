import 'package:bloc/bloc.dart';
import 'package:howabout_coffee/app/modules/login/state/login_state.dart';

class LoginController extends Cubit<LoginState> {
  LoginController() : super(const LoginState.initial());
}
