import 'package:howabout_coffee/app/core/config/base_config.dart';

class B4aRemoteConfig implements Env {
  @override
  operator [](String key) {
    return '';
  }

  @override
  Future<void> load() async {}
}
