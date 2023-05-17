// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:howabout_coffee/app/data/exceptions/invalid_email_exception.dart';
import 'package:howabout_coffee/app/data/exceptions/user_not_found_exception.dart';
import 'package:howabout_coffee/app/data/exceptions/user_password_exception.dart';
import 'package:howabout_coffee/app/data/exceptions/username_in_use_exception.dart';
import 'package:howabout_coffee/app/data/exceptions/weak_password_exception.dart';
import 'package:howabout_coffee/app/data/models/client.dart';

import './auth_service.dart';

class AuthServiceImpl implements AuthService {
  final FirebaseAuth _instance;
  AuthServiceImpl({
    required FirebaseAuth instance,
  }) : _instance = instance;
  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      final credential = await _instance.signInWithEmailAndPassword(email: email, password: password);

      print(credential);
    } on FirebaseAuthException catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      if (e.code == 'user-not-found') {
        throw UserNotFoundException('User not found', stack: s);
      } else if (e.code == 'wrong-password') {
        throw UserPasswordException('User not found', stack: s);
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException('Invalid email', stack: s);
      }
    }
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
  Client? getCurrentUser() {
    if (_instance.currentUser == null) {
      return null;
    }
    return Client.fromFirebase(_instance.currentUser!);
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
        log('The account already exists for that email.', error: e, stackTrace: s);
        throw EmailInUseException('Email in use', stack: s);
      }

      // rethrow;
    }
  }
}
