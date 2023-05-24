enum ConfigType {
  dotenv('dot_env'),
  remoteConfig('remote_config'),
  b4app('b4app');

  final String type;

  const ConfigType(this.type);
}
