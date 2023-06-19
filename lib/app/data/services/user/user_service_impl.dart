// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/repositories/user/user_repository.dart';

import 'user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _repository;

  ClientModel? _currentUser;

  UserServiceImpl({
    required UserRepository repository,
  }) : _repository = repository;

  @override
  Future<ClientModel?> getUser() async {
    final user = await _repository.getUser();
    _currentUser = user;
    return user;
  }

  @override
  Future<bool> save(ClientModel client) async {
    return await _repository.save(client);
  }

  @override
  Future<ClientModel> updateUser({required ClientModel client, File? profilePicture}) async {
    final user = await _repository.updateUser(client: client, profilePicture: profilePicture);
    _currentUser = user;
    return user;
  }

  @override
  Future<List<int>> getFavoriteUser(ClientModel? user) async {
    return await _repository.getFavoriteUser(user);
  }

  @override
  ClientModel? get currentUser => _currentUser;

  @override
  Future<List<int>> manageFavorites(ClientModel client, int productId) async {
    return await _repository.manageFavorites(client, productId);
  }
}
