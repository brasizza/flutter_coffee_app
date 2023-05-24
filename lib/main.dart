import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:howabout_coffee/app/app_widget.dart';
import 'package:howabout_coffee/app/core/config/b4a_config.dart';
import 'package:howabout_coffee/app/core/config/env_maker.dart';
import 'package:howabout_coffee/app/core/global/translation/app_translation.dart';
import 'package:howabout_coffee/app/core/local_storage/local_storage.dart';
import 'package:howabout_coffee/app/data/enums/config_types.dart';

import 'app/core/local_storage/local_storage_impl_shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await B4aConfig().init();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final env = await EnvMaker.create(ConfigType.b4app);
  final LocalStorage storageImpl = LocalStorageImplShared()..init();
  final AppTranslation translation = AppTranslation()..init();
  runApp(AppWidget(env: env, storage: storageImpl, translation: translation));
}
