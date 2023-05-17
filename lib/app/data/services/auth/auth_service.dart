import 'package:firebase_auth/firebase_auth.dart';
import 'package:howabout_coffee/app/data/models/client.dart';

abstract class AuthService {
  Future<void> signIn({required String email, required String password});
  Future<void> signUp({required String email, required String password, required String name});
  Future<void> signOut();
  bool isLogged();
  Client? getCurrentUser();
  Stream<User?> listenUser();
}
