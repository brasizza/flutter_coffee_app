import 'package:howabout_coffee/app/data/models/client_model.dart';

abstract class UserService {
  Future<bool> save(ClientModel client);
  Future<bool> login(ClientModel client);
}
