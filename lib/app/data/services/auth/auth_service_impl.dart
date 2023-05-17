// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:howabout_coffee/app/data/exceptions/weak_password_exception.dart';

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

  @override
  Stream<User?> listenUser() {
    return _instance.authStateChanges();
  }

  @override
  Future<void> signUp({required String email, required String password, required String name}) async {
    try {
      final credential = await _instance.createUserWithEmailAndPassword(email: email, password: password);
      await credential.user?.updateDisplayName(name);
      await credential.user?.sendEmailVerification();
    } on FirebaseAuthException catch (e, s) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.', error: e, stackTrace: s);
        throw WeakPasswordException('Password too weak', stack: s);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }

      // rethrow;
    }
  }
}
