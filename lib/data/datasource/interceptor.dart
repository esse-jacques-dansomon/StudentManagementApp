// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'authentication_bloc.dart';
//
// class TokenInterceptor extends Interceptor {
//   final Dio dio;
//   final FlutterSecureStorage storage;
//   final AuthenticationBloc authenticationBloc;
//
//   TokenInterceptor(this.dio, this.storage, this.authenticationBloc);
//
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       dio.lock();  // Lock the dio instance to prevent other requests
//       try {
//         final refreshToken = await storage.read(key: 'refreshToken');
//         if (refreshToken != null) {
//           final newToken = await _refreshToken(refreshToken);
//
//           // Update the storage with the new token
//           await storage.write(key: 'token', value: newToken);
//
//           // Retry the original request with the new token
//           final requestOptions = err.requestOptions;
//           requestOptions.headers['Authorization'] = 'Bearer $newToken';
//           final response = await dio.request(
//             requestOptions.path,
//             options: Options(
//               method: requestOptions.method,
//               headers: requestOptions.headers,
//             ),
//             data: requestOptions.data,
//             queryParameters: requestOptions.queryParameters,
//           );
//           handler.resolve(response);
//         } else {
//           _logoutUser();
//           handler.next(err);
//         }
//       } catch (e) {
//         _logoutUser();
//         handler.next(err);  // Let the error propagate if the refresh fails
//       } finally {
//         dio.unlock();  // Unlock the dio instance
//       }
//     } else {
//       handler.next(err);  // Let the error propagate if it's not a 401
//     }
//   }
//
//   Future<String> _refreshToken(String refreshToken) async {
//     final response = await dio.post('/refresh-token', data: {'refreshToken': refreshToken});
//     if (response.statusCode == 200) {
//       return response.data['token'];
//     } else {
//       throw Exception('Failed to refresh token');
//     }
//   }
//
//   void _logoutUser() {
//     // Emit LoggedOut event to AuthenticationBloc
//     authenticationBloc.add(LoggedOut());
//   }
// }
