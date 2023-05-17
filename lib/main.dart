import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:howabout_coffee/app/core/config/base_config.dart';
import 'package:howabout_coffee/app/core/config/env_maker.dart';
import 'package:howabout_coffee/app/core/rest/dio/dio_rest_client.dart';
import 'package:howabout_coffee/app/core/rest/rest_client.dart';
import 'package:howabout_coffee/app/data/enums/config_types.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service_impl.dart';
import 'package:howabout_coffee/app/routes/routes.dart';
import 'package:provider/provider.dart';

import 'app/core/ui/theme/theme_config.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final env = await EnvMaker.create(ConfigType.dotenv);

  await FirebaseAuth.instance.signOut();
  runApp(
    MultiProvider(
      providers: [
        Provider<Env>(create: ((context) => env)),
        Provider<RestClient>(create: ((context) => DioRestClient.instance..init(env: env))),
        Provider<AuthService>(
          create: ((context) => AuthServiceImpl(instance: FirebaseAuth.instance)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'How about coffee',
        theme: ThemeConfig.theme,
        routes: Routes.instance.routes,
      ),
    ),
  );
}
