// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/core/exceptions/b4app_exception.dart';
import 'package:howabout_coffee/app/core/exceptions/invalid_email_exception.dart';
import 'package:howabout_coffee/app/core/exceptions/sign_up_exception.dart';
import 'package:howabout_coffee/app/core/exceptions/user_not_found_exception.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import './auth_service.dart';

class AuthServiceImpl implements AuthService {
  @override
  Future<bool> isLogged() async {
    ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
    if (currentUser == null) {
      return false;
    }
    //Checks whether the user's session token is valid
    final ParseResponse? parseResponse = await ParseUser.getCurrentUserFromServer(currentUser.sessionToken!);
    if (parseResponse?.success == null || !parseResponse!.success) {
      //Invalid session. Logout
      await currentUser.logout();
      return false;
    } else {
      final installation = await ParseInstallation.currentInstallation();
      installation.set('user', currentUser);
      await installation.save();
      return true;
    }
  }

  @override
  Future<ClientModel> signIn({required String email, required String password}) async {
    final user = ParseUser(email, password, email);
    final parseResponse = await user.login();

    if (!parseResponse.success) {
      if (parseResponse.error != null) {
        throw InvalidEmailException(parseResponse.error?.message ?? 'Fail to login1');
      }
    }
    final installation = await ParseInstallation.currentInstallation();
    installation.set('user', user);
    await installation.save();

    return ClientModel.fromParse(parseResponse.results?.first);
  }

  @override
  Future<void> signOut() async {
    final user = await ParseUser.currentUser() as ParseUser?;
    await user?.logout();
  }

  @override
  Future signUp({required String email, required String password}) async {
    ParseResponse? parseResponse;

    try {
      final user = ParseUser.createUser(email, password, email);
      parseResponse = await user.signUp();
      if (parseResponse.error != null) {
        throw SignUpException(parseResponse.error?.message ?? 'Erro login');
      }
    } catch (e, s) {
      throw SignUpException(parseResponse?.error?.message ?? 'Erro login', stack: s);
    }
  }

  @override
  Future<bool> forgotPassword({required String email}) async {
    ParseResponse? parseResponse;

    try {
      final user = ParseUser(email.trim(), null, email.trim());

      parseResponse = await user.requestPasswordReset();
      if (parseResponse.error != null) {
        throw UserNotFoundException(parseResponse.error?.message ?? 'Erro login');
      }
      return true;
    } catch (e, s) {
      throw Back4AppException(parseResponse?.error?.message ?? 'Erro login', stack: s);
    }
  }

  @override
  Future<bool> removeAccount() async {
    ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
    final response = await currentUser?.delete();
    if ((response?.success ?? false) == true) {
      return true;
    } else {
      return false;
    }
  }
}
