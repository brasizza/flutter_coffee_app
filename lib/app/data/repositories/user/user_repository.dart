import 'package:howabout_coffee/app/data/models/client_model.dart';

abstract class UserRepository {
  Future<bool> save(ClientModel client);
  Future<ClientModel?> getUser();
}
