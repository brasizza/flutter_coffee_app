// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:howabout_coffee/app/core/rest/dio/dio.dart';
import 'package:howabout_coffee/app/data/exceptions/user_not_found_exception.dart';
import 'package:howabout_coffee/app/data/models/auth_model.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient _rest;
  UserRepositoryImpl({
    required RestClient rest,
  }) : _rest = rest;

  @override
  Future<bool> save(ClientModel client) async {
    final response = await _rest.post('/users', data: client.toJson());
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Future<AuthModel?> login(ClientModel client) async {
    try {
      final response = await _rest.post('/auth', data: client.toJson());
      if (response.statusCode != 200) {
        throw Exception('Falha ao fazer o login');
      } else {
        return AuthModel.fromMap(response.data);
      }
    } on RestClientException catch (e, s) {
      log('Erro', error: e, stackTrace: s);
      throw UserNotFoundException('Falha ao fazer o login', stack: s);
    }
  }
}
