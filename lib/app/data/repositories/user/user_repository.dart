import 'package:howabout_coffee/app/data/models/auth_model.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';

abstract class UserRepository {
  Future<bool> save(ClientModel client);
  Future<AuthModel?> auth(ClientModel client);
  Future<ClientModel?> getUser();
}
