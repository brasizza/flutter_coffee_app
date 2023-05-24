import 'package:howabout_coffee/app/core/config/base_config.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class B4aRemoteConfig implements Env {
  Map<String, dynamic> maps = {};
  @override
  operator [](String key) {
    return (maps.containsKey(key)) ? maps[key] : '';
  }

  @override
  Future<void> load() async {
    var response = await ParseConfig().getConfigs();
    if (response.success) {
      maps = response.result;
    }
  }
}
