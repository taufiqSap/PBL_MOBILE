import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  // Write data to secure storage
  Future<void> writeData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Read data from secure storage
  Future<String?> readData(String key) async {
    return await _storage.read(key: key);
  }

  // Delete data from secure storage
  Future<void> deleteData(String key) async {
    await _storage.delete(key: key);
  }

  // Delete all data from secure storage
  Future<void> deleteAllData() async {
    await _storage.deleteAll();
  }

  // Check if a key exists
  Future<bool> containsKey(String key) async {
    final allKeys = await _storage.readAll();
    return allKeys.containsKey(key);
  }
}
