import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class CacheRepository {
  void setString({required String key, required String? value});
  Future<String?> getString({required String key});
}

class CacheHelper implements CacheRepository {
  factory CacheHelper(FlutterSecureStorage storage) {
    return _instance ??= CacheHelper._(storage);
  }

  CacheHelper._(this._storage);

  static CacheHelper? _instance;

  final FlutterSecureStorage _storage;

  @override
  Future<String?> getString({required String key}) {
    return _storage.read(key: key);
  }

  @override
  void setString({required String key, required String? value}) {
    _storage.write(key: key, value: value);
  }
}
