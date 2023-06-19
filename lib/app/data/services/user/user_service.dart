import 'dart:io';

import 'package:howabout_coffee/app/data/models/client_model.dart';

abstract class UserService {
  Future<bool> save(ClientModel client);
  Future<ClientModel?> getUser();
  Future<ClientModel> updateUser({required ClientModel client, File? profilePicture});
}
