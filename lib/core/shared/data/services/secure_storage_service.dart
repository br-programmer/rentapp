import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class SecureStorageService {
  SecureStorageService({required FlutterSecureStorage storage})
      : _storage = storage;

  final FlutterSecureStorage _storage;

  Future<void> write({required String key, required String value}) {
    return _storage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) => _storage.read(key: key);

  Future<Map<String, dynamic>?> readJson({required String key}) async {
    final json = await _storage.read(key: key);
    if (json == null) {
      return null;
    }
    return json.decode;
  }

  Future<void> writeJson({
    required String key,
    required Map<String, dynamic> value,
  }) {
    return _storage.write(key: key, value: value.encode);
  }

  Future<void> delete({required String key}) => _storage.delete(key: key);

  Future<void> deleteAll() => _storage.deleteAll();

  Future<Map<String, String>> readAll() => _storage.readAll();
}
