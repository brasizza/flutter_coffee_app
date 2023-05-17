import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<void> signIn();

  Future<void> signUp({required String email, required String password, required String name});
  Future<void> signOut();
  bool isLogged();
  User? getCurrentUser();

  Stream<User?> listenUser();
}
