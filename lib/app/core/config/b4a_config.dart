import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class B4aConfig {
  Future<Parse> init() async {
    const keyApplicationId = String.fromEnvironment('APPLICATION_ID');
    const keyClientKey = String.fromEnvironment('CLIENT_ID');
    const keyParseServerUrl = 'https://parseapi.back4app.com';
    final parse = await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
      debug: true,
    );
    await parse.healthCheck(debug: true);
    return parse;
  }
}
