// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/core/exceptions/user_not_found_exception.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<bool> save(ClientModel client) async {
    throw UnimplementedError();
  }

  @override
  Future<ClientModel?> getUser() async {
    final parseUser = await ParseUser.currentUser() as ParseUser?;
    if (parseUser == null) {
      throw UserNotFoundException('User not found');
    }
    return ClientModel.fromParse(parseUser);
  }
}
