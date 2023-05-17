// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:howabout_coffee/app/core/auth/auth_service.dart';
// import 'package:howabout_coffee/app/core/config/base_config.dart';
// import 'package:howabout_coffee/app/core/config/consts.dart';
// import 'package:howabout_coffee/app/core/config/env_maker.dart';
// import 'package:howabout_coffee/app/core/local_storage/local_storage.dart';
// import 'package:howabout_coffee/app/core/local_storage/local_storage_get.dart';
// import 'package:howabout_coffee/app/core/rest/dio/dio_rest_client.dart';
// import 'package:howabout_coffee/app/core/rest/rest_client.dart';
// import 'package:howabout_coffee/app/data/enums/config_types.dart';

// class ApplicationBindings extends Bindings {
//   @override
//   void dependencies() async {
//     await Get.putAsync<Env>(() => EnvMaker.create((kDebugMode ? ConfigType.dotenv : ConfigType.remoteConfig)), permanent: true);
//     await Get.putAsync<AuthService>(() => AuthService().init());
//     Get.put<RestClient>(DioRestClient.instance..init(env: Get.find<Env>()), permanent: true);
//     Get.lazyPut<LocalStorage>(() => LocalStorageGet(), fenix: true, tag: Consts.STORAGE);
//   }
// }
