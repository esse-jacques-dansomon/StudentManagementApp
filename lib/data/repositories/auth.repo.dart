import 'dart:convert';

import 'package:school_managment/data/models/auth_model.dart';
import 'package:school_managment/data/models/auth_response.dart';

import '../datasource/AppHttpClient.dart';

class AuthRepository {
  final AppHttpClient httpClient;
  AuthRepository({
    required this.httpClient,
  });

  Future<AuthResponse> login(AuthModel authModel) async {

    try {
      final response = await httpClient.post(
          '/auth/login',
          data: authModel.toJson()
      );

      if (response.statusCode == 200) {
        print(response.body);
        return AuthResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic> );
      } else {
        print('NOT LOGIN ERROR');
        throw Exception('Failed to load classrooms');
      }
    } catch (e) {
      print(e);
      throw e; // Or handle it in a way appropriate to your application
    }
  }

  void logout() {
    httpClient.delete('/logout');
  }



}