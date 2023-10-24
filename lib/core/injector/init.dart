// ignore_for_file: avoid_redundant_argument_values

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

Future<void> init(Environment environment) async {
  final config = environment.config;
  final enableLogging = config.enableLogging;
  injectServices(storage: const FlutterSecureStorage());
  final dio = Dio(BaseOptions(baseUrl: DartDefine.baseUrl));
  dio.interceptors.addAll([
    RetryInterceptor(dio: dio, enableLogging: enableLogging),
    AuthInterceptor(authClientService: Services.authClient),
  ]);
  final http = Http(dio: dio, enableLogging: enableLogging);
  injectRepositories(config: config, http: http);
  final sharedPreferences = Services.sharedPreferences;
  await sharedPreferences.init();
  const firstLaunchKey = StorageKeys.firstLaunch;
  final firstLaunch = sharedPreferences.getBool(key: firstLaunchKey) ?? true;
  if (firstLaunch) {
    await Future.wait<void>([
      sharedPreferences.setBool(key: firstLaunchKey, value: false),
      Services.secureStorage.deleteAll(),
    ]);
  }
}
