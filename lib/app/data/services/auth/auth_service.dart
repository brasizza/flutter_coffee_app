// import 'package:firebase_auth/firebase_auth.dart';

import 'package:howabout_coffee/app/data/models/client_model.dart';

abstract class AuthService {
  Future<ClientModel> signIn({required String email, required String password});
  Future signUp({required String email, required String password});
  Future<bool> forgotPassword({required String email});
  Future<void> signOut();
  Future<bool> isLogged();
}
