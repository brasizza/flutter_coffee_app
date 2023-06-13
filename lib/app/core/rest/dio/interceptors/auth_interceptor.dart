import 'package:dio/dio.dart';
import 'package:howabout_coffee/app/core/config/base_config.dart';
import 'package:howabout_coffee/app/core/local_storage/local_storage.dart';

import '../../../global/global_context.dart';

class AuthInterceptor extends Interceptor {
  final LocalStorage storage;
  final Env env;

  AuthInterceptor({required this.storage, required this.env});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await storage.getData(env['AUTH_TOKEN']);
    options.headers['Authorization'] = 'Bearer $accessToken';

    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      GlobalContext.instance.loginExpire(storage);
    } else {
      handler.next(err);
    }
  }
}
