// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/repositories/user/user_repository.dart';

import 'user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _repository;
  UserServiceImpl({
    required UserRepository repository,
  }) : _repository = repository;

  @override
  Future<ClientModel?> getUser() async {
    return await _repository.getUser();
  }

  @override
  Future<bool> save(ClientModel client) async {
    return await _repository.save(client);
  }

  @override
  Future<ClientModel> updateUser({required ClientModel client, File? profilePicture}) async {
    return await _repository.updateUser(client: client, profilePicture: profilePicture);
  }
}
