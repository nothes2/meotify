import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureStorageRepositoryImpl extends GetxController {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveData(String key, String data) async {
    await _storage.write(key: key, value: data.toString());
  }

  Future getData(String key) async {
    String? value = await _storage.read(key: key);
    return value;
  }

  Future<void> deleteData(String key) async {
    await _storage.delete(key: key);
  }
}
