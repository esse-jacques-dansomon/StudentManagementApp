import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:school_managment/config/app_constantes.dart';
import 'package:school_managment/data/models/auth_model.dart';
import 'package:school_managment/data/models/auth_response.dart';

import '../datasource/AppHttpClient.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthRepository {
  final AppHttpClient httpClient;
  final FlutterSecureStorage secureStorage;

  AuthRepository( {
    required this.httpClient,
    required this.secureStorage,
  });

  Future<AuthResponse> login(AuthModel authModel) async {
    try {
      final response =
          await httpClient.post('/auth/login', data: authModel.toJson());

      if (response.statusCode == 200) {
        // _controller.add(AuthenticationStatus.authenticated);
        return AuthResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load classrooms');
      }
    } catch (e) {
      throw e; // Or handle it in a way appropriate to your application
    }
  }

  Future<void> logout() async {
    // _controller.add(AuthenticationStatus.unauthenticated);
    await deleteToken();
    //httpClient.delete('/logout');
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await secureStorage.delete(key: AppConstants.TOKEN);
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await secureStorage.write(key: AppConstants.TOKEN, value: token);
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    final token =  await secureStorage.read(key: AppConstants.TOKEN);
    if (token!= null) {
      return true;
    }
    return false;
  }

  getStudent() {}


  // void dispose() => _controller.close();
}
