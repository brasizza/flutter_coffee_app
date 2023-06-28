import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class B4aConfig {
  Future<Parse> init() async {
    const keyApplicationId = String.fromEnvironment('APPLICATION_ID');
    const keyClientKey = String.fromEnvironment('CLIENT_ID');
    const keyParseServerUrl = 'https://parseapi.back4app.com';
    const liveQueryUrl = String.fromEnvironment('LIVE_QUERY_URL');
    final parse = await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      liveQueryUrl: liveQueryUrl,
      autoSendSessionId: true,
    );
    await parse.healthCheck(debug: true);
    return parse;
  }
}
