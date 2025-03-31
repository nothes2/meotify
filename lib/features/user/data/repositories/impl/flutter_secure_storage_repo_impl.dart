import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:meowdify/features/user/data/repositories/flutter_secure_storage_repo.dart';

class SecureStorageRepositoryImpl extends GetxController
    implements SecureStorageRepository {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'jwt_token', value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: 'jwt_token');
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: 'jwt_token');
  }
}
