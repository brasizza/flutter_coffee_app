import 'dart:io';

import 'package:howabout_coffee/app/data/models/client_model.dart';

abstract class UserRepository {
  Future<bool> save(ClientModel client);
  Future<ClientModel?> getUser();
  Future<ClientModel> updateUser({required ClientModel client, File? profilePicture});

  Future<List<int>> getFavoriteUser(ClientModel? user);

  Future<List<int>> manageFavorites(ClientModel client, int productId);
}
