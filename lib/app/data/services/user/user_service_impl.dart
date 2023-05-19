// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/core/config/base_config.dart';
import 'package:howabout_coffee/app/core/local_storage/local_storage.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/repositories/user/user_repository.dart';

import './user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _repository;
  final LocalStorage _storage;
  final Env _env;
  UserServiceImpl({
    required UserRepository repository,
    required LocalStorage storage,
    required Env env,
  })  : _repository = repository,
        _env = env,
        _storage = storage;

  @override
  Future<bool> save(ClientModel client) async {
    return await _repository.save(client);
  }

  @override
  Future<bool> login(ClientModel client) async {
    final authModel = await _repository.login(client);
    if (authModel != null) {
      await _storage.setData(_env['AUTH_TOKEN'], authModel.accessToken);
      return true;
    }
    return false;
  }
}
