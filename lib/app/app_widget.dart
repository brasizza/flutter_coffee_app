import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:howabout_coffee/app/core/company/company_controller.dart';
import 'package:howabout_coffee/app/core/global/translation/app_translation.dart';
import 'package:howabout_coffee/app/core/location/location_service.dart';
import 'package:howabout_coffee/app/data/repositories/company/company_repository.dart';
import 'package:howabout_coffee/app/data/repositories/company/company_repository_impl.dart';
import 'package:howabout_coffee/app/data/services/company/company_service.dart';
import 'package:howabout_coffee/app/data/services/company/company_service_impl.dart';
import 'package:howabout_coffee/app/routes/routes.dart';
import 'package:provider/provider.dart';

import 'core/config/base_config.dart';
import 'core/global/global_context.dart';
import 'core/local_storage/local_storage.dart';
import 'core/local_storage/local_storage_impl_shared.dart';
import 'core/rest/dio/dio_rest_client.dart';
import 'core/rest/rest_client.dart';
import 'core/ui/theme/theme_config.dart';
import 'data/repositories/user/user_repository.dart';
import 'data/repositories/user/user_repository_impl.dart';
import 'data/services/auth/auth_service.dart';
import 'data/services/auth/auth_service_impl.dart';
import 'data/services/user/user_service.dart';
import 'data/services/user/user_service_impl.dart';

class AppWidget extends StatefulWidget {
  final Env env;
  const AppWidget({
    super.key,
    required this.env,
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
        Provider<LocationService>(create: (context) => LocationService()),
        Provider<UserRepository>(create: (context) => UserRepositoryImpl()),
        Provider<UserService>(create: (context) => UserServiceImpl(repository: context.read())),
        Provider<LocalStorage>(create: ((context) => LocalStorageImplShared()..init()), lazy: false),
        Provider<CompanyRepository>(create: (context) => CompanyRepositoryImpl()),
        Provider<CompanyService>(create: (context) => CompanyServiceImpl(repository: context.read())),
        Provider<CompanyController>(create: (context) => CompanyController(service: context.read())..init()),
        Provider<RestClient>(create: ((context) => DioRestClient.instance..init(env: context.read(), storage: context.read()))),
        Provider<AuthService>(create: ((context) => AuthServiceImpl())),
        Provider<CompanyController>(create: (context) => CompanyController(service: context.read())..init(), lazy: false),
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
        localeResolutionCallback: (
          locale,
          supportedLocales,
        ) {
          if (supportedLocales.contains(Locale(locale!.languageCode))) {
            AppTranslation.currentLocale = locale.languageCode;
            return locale;
          } else {
            return const Locale('en');
          }
        },
        // locale: const Locale('jp'),
        title: 'How about coffee',
        theme: ThemeConfig.theme,
        routes: Routes.instance.routes,
        navigatorKey: navKey,
      ),
    );
  }
}
