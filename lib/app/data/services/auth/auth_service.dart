import 'package:firebase_auth/firebase_auth.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';

abstract class AuthService {
  Future<User?> signIn({required String email, required String password});
  Future<User?> signUp({required String email, required String password, required String name});
  Future<void> signOut();
  bool isLogged();
  ClientModel? getCurrentUser();
  Stream<User?> listenUser();
}
