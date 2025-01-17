// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'login_state.g.dart';

@match
enum LoginStatus { initial, loading, loaded, error, resendPassword, emptyEmail }

class LoginState extends Equatable {
  final LoginStatus status;
  final String? errorMessage;
  const LoginState({required this.status, this.errorMessage = ''});
  @override
  List get props => [status, errorMessage];
  const LoginState.initial()
      : status = LoginStatus.initial,
        errorMessage = '';

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
