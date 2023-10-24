import 'package:get_it/get_it.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';

enum Environment {
  dev(),
  staging(),
  prod();

  IConfig get config {
    switch (this) {
      case Environment.dev:
        return DevConfig();
      case Environment.staging:
        return StagingConfig();
      case Environment.prod:
        return ProdConfig();
    }
  }
}

void injectRepositories({
  required IConfig config,
  required Http http,
}) {
  GetIt.I.registerLazySingleton<IConfig>(() => config);
  GetIt.I.registerLazySingleton<IAuthRepository>(
    () => AuthRepository(http: http),
  );
  GetIt.I.registerLazySingleton<IUserRepository>(
    () => UserRepository(http: http),
  );
  GetIt.I.registerLazySingleton<IAddressRepository>(
    () => AddressRepository(http: http),
  );
  GetIt.I.registerLazySingleton<IAuthUsecase>(
    () => AuthUsecase(
      authRepository: Repositories.auth,
      authClientService: Services.authClient,
    ),
  );
}

class Repositories {
  Repositories._();
  static IConfig get config => GetIt.I.get();
  static IAuthRepository get auth => GetIt.I.get();
  static IUserRepository get user => GetIt.I.get();
  static IAddressRepository get address => GetIt.I.get();
  static IAuthUsecase get authUsecase => GetIt.I.get();
}
