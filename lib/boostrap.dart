import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/i18n/translations.g.dart';

Future<void> bootstrap(Environment environment) async {
  final enableLogging = environment.config.enableLogging;
  return runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      await init(environment);
      LocaleSettings.useDeviceLocale();
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      runApp(TranslationProvider(child: const RentApp()));
      FlutterNativeSplash.remove();
      FlutterError.onError = (details) {
        if (enableLogging) {
          log(details.exceptionAsString(), stackTrace: details.stack);
        }
      };
    },
    (error, stack) {
      if (enableLogging) {
        log(error.toString(), stackTrace: stack);
      }
    },
  );
}
