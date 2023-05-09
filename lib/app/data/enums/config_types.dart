
enum ConfigType {
  dotenv('dot_env'),
  remoteConfig('remote_config');

  final String type;

  const ConfigType(this.type);
}
