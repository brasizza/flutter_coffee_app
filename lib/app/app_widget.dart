import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:howabout_coffee/app/core/global/translation/app_translation.dart';
import 'package:howabout_coffee/app/routes/routes.dart';
import 'package:provider/provider.dart';

import 'core/config/base_config.dart';
import 'core/global/global_context.dart';
import 'core/local_storage/local_storage.dart';
import 'core/rest/dio/dio_rest_client.dart';
import 'core/rest/rest_client.dart';
import 'core/ui/theme/theme_config.dart';
import 'data/repositories/user/user_repository.dart';
import 'data/repositories/user/user_repository_impl.dart';
import 'data/services/auth/auth_service.dart';
import 'data/services/auth/auth_service_impl.dart';
import 'data/services/user/user_repository_impl.dart';
import 'data/services/user/user_service.dart';

class AppWidget extends StatefulWidget {
  final Env env;
  final LocalStorage storage;
  final AppTranslation translation;
  const AppWidget({
    super.key,
    required this.env,
    required this.storage,
    required this.translation,
  });

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final navKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    GlobalContext.instance.navigatorKey = navKey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Env>(create: ((context) => widget.env)),
        Provider<AppTranslation>(create: ((context) => widget.translation)),
        Provider<LocalStorage>(create: ((context) => widget.storage)),
        Provider<RestClient>(create: ((context) => DioRestClient.instance..init(env: context.read(), storage: context.read()))),
        Provider<AuthService>(create: ((context) => AuthServiceImpl())),
        Provider<UserRepository>(create: (context) => UserRepositoryImpl(rest: context.read())),
        Provider<UserService>(create: (context) => UserServiceImpl(repository: context.read())),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        supportedLocales: const [
          Locale('en'),
          Locale('es'),
          Locale('pt'),
        ],
        locale: Locale('pt'),
        title: 'How about coffee',
        theme: ThemeConfig.theme,
        routes: Routes.instance.routes,
        navigatorKey: navKey,
      ),
    );
  }
}
