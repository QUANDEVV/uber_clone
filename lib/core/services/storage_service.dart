import 'package:get_storage/get_storage.dart';

class StorageService {
  static final _storage = GetStorage();
  static const _tokenKey = 'auth_token';

  static Future<void> init() async {
    await GetStorage.init();
  }

  static String? getToken() {
    return _storage.read<String>(_tokenKey);
  }

  static Future<void> setToken(String token) async {
    await _storage.write(_tokenKey, token);
  }

  static Future<void> removeToken() async {
    await _storage.remove(_tokenKey);
  }

  static bool hasToken() {
    return _storage.hasData(_tokenKey);
  }
}
