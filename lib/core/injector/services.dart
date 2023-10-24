import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:rentapp/core/core.dart';

void injectServices({
  required FlutterSecureStorage storage,
}) {
  GetIt.I.registerLazySingleton(
    () => SecureStorageService(storage: storage),
  );
  GetIt.I.registerLazySingleton(
    () => SharedPreferencesService(),
  );
  GetIt.I.registerLazySingleton(
    () => AuthClientService(
      secureStorageService: Services.secureStorage,
    ),
  );
}

class Services {
  Services._();
  static SecureStorageService get secureStorage => GetIt.I.get();
  static SharedPreferencesService get sharedPreferences => GetIt.I.get();
  static AuthClientService get authClient => GetIt.I.get();
}
