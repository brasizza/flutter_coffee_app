// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import './auth_service.dart';

class AuthServiceImpl implements AuthService {
  final FirebaseAuth _instance;
  AuthServiceImpl({
    required FirebaseAuth instance,
  }) : _instance = instance;
  @override
  Future<void> signIn() async {
    // await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    await _instance.signOut();
  }

  @override
  bool isLogged() {
    return (getCurrentUser() == null) ? false : true;
  }

  @override
  User? getCurrentUser() {
    return _instance.currentUser;
  }
}
