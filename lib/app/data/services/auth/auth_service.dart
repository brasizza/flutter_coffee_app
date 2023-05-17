import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<void> signIn();
  Future<void> signOut();
  bool isLogged();
  User? getCurrentUser();
}
