import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/local_storage/local_storage.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class GlobalContext {
  //! ATENÇÃO NUNCA deixar o navigatorKey como PUBLICO!!!!
  late final GlobalKey<NavigatorState> _navigatorKey;

  static GlobalContext? _instance;

  GlobalContext._();

  static GlobalContext get instance {
    _instance ??= GlobalContext._();
    return _instance!;
  }

  set navigatorKey(GlobalKey<NavigatorState> key) => _navigatorKey = key;

  Future<void> loginExpire(LocalStorage storage) async {
    final navContext = _navigatorKey.currentContext;
    final authService = navContext!.read<AuthService>();
    final navigator = Navigator.of(navContext);
    await storage.clearStorage();
    await authService.signOut();
    navigator.pushReplacementNamed('/presentation');
  }
}
