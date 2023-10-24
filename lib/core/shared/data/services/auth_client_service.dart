import 'package:rentapp/core/core.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class AuthClientService {
  AuthClientService({
    required SecureStorageService secureStorageService,
  }) : _secureStorageService = secureStorageService;

  final SecureStorageService _secureStorageService;

  FutureEither<String, void> get accessToken async {
    final value = await _secureStorageService.read(key: StorageKeys.tokenInfo);
    if (value != null) {
      return Either.left(value);
    }
    return const Either.right(null);
  }

  FutureEither<void, void> saveToken(String token) async {
    try {
      await _secureStorageService.write(
        key: StorageKeys.tokenInfo,
        value: token,
      );
      return const Either.left(null);
    } catch (_) {
      return const Either.right(null);
    }
  }

  FutureEither<void, void> logout() async {
    try {
      await _secureStorageService.deleteAll();
      return const Either.left(null);
    } catch (_) {
      return const Either.right(null);
    }
  }
}
