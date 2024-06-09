import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/app_constantes.dart';

class AppHttpClient {
  final String baseUrl;
  final SharedPreferences sharedPreferences;

  String token = '';
  String countryCode = '';

  AppHttpClient({required this.baseUrl,required this.sharedPreferences}) {
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';
    countryCode = sharedPreferences.getString(AppConstants.APP_NAME) ?? '';
  }

  void updateHeader(String countryCode) {
    this.countryCode = countryCode;
  }

  Future<http.Response> get(
      String uri, {
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';

      final url = Uri.parse('$baseUrl$uri').replace(queryParameters: queryParameters);
      print(url);
      final response = await http.get(
        url,
        headers: _headers(),
      );
      _handleResponse(response);
      return response;
    } on SocketException catch (e) {
      print(e.toString());
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      print("Error: ");
      throw const FormatException("Unable to process the data");
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<http.Response> post(
      String uri, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';

      final url = Uri.parse('$baseUrl$uri').replace(queryParameters: queryParameters);
      print(url.toString());
      final response = await http.post(
        url,
        headers: _headers(),
        body: jsonEncode(data),
      );
      _handleResponse(response);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> put(
      String uri, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';

      final url = Uri.parse('$baseUrl$uri').replace(queryParameters: queryParameters);
      final response = await http.put(
        url,
        headers: _headers(),
        body: jsonEncode(data),
      );
      _handleResponse(response);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> delete(
      String uri, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';

      final url = Uri.parse('$baseUrl$uri').replace(queryParameters: queryParameters);
      final response = await http.delete(
        url,
        headers: _headers(),
        body: jsonEncode(data),
      );
      _handleResponse(response);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      // AppConstants.COUNTRY_CODE: countryCode.toUpperCase(),
    };
  }

  void _handleResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpException('Failed request with status code: ${response.statusCode}');
    }
  }
}
