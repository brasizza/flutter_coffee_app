import 'package:howabout_coffee/app/core/config/b4app/b4a_remote_config.dart';

import '../../data/enums/config_types.dart';
import 'base_config.dart';
import 'env/env_config.dart';

class EnvMaker {
  static Future<Env> create(ConfigType type) async {
    late final Env config;
    switch (type) {
      case ConfigType.dotenv:
        config = DotEnvConfig();
        config.load();
        return config;
      case ConfigType.remoteConfig:
        throw UnimplementedError();
      // return RemoteConfig()..load();

      case ConfigType.b4app:
        config = B4aRemoteConfig();
        await config.load();
        return config;
      default:
        throw UnimplementedError();
    }
  }
}
