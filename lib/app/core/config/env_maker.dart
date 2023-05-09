import '../../data/enums/config_types.dart';
import 'base_config.dart';
import 'env/env_config.dart';
import 'remote/remote_config.dart';

class EnvMaker {
  static Future<Env> create(ConfigType type) async {
    late final Env config;
    switch (type) {
      case ConfigType.dotenv:
        config = DotEnvConfig();
        await config.load();
        return config;
      case ConfigType.remoteConfig:
        return RemoteConfig()..load();
      default:
        throw UnimplementedError();
    }
  }
}
