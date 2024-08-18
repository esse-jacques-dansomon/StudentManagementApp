import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:school_managment/data/models/auth_response.dart';

import '../config/app_constantes.dart';

class SecureStorage {
  final FlutterSecureStorage storage;

  SecureStorage({ required this.storage});

  static const _tokenKey = AppConstants.TOKEN;
  static const _user = AppConstants.user;

  Future<void> persistUserAndToken(AuthResponse student, String token) async {
    await storage.write(key: _user, value: jsonEncode(student.toJson()));
    await storage.write(key: _tokenKey, value: token);
  }

  Future<bool> hasToken() async {
    var value = await storage.read(key: _tokenKey);
    return value != null;
  }

  Future<bool> hasUser() async {
    var value = await storage.read(key: _user);
    if (value != null && value.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> deleteToken() async {
    return storage.delete(key: _tokenKey);
  }

  Future<void> deleteUser() async {
    return storage.delete(key: _user);
  }

  Future<AuthResponse?> getUser() async {
    try {
      final userData = await storage.read(key: _user);
      if (userData != null) {
        return AuthResponse.fromJson(jsonDecode(userData));
      }
      return null;
    }catch (e) {
      return null;
    }

  }

  Future<String?> getToken()  async {
    return await storage.read(key: _tokenKey);
  }

  Future<void> deleteAll() async {
    return storage.deleteAll();
  }
}
