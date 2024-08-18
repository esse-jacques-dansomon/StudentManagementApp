import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:school_managment/data/repositories/auth.repo.dart';
import 'package:school_managment/data/repositories/course.repo.dart';
import 'package:school_managment/data/repositories/session.repo.dart';
import 'package:school_managment/ui/pages/home/bloc/home_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_constantes.dart';
import '../data/datasource/AppHttpClient.dart';
import '../data/repositories/classrom.repo.dart';
import '../ui/pages/auth/bloc/auth_bloc.dart';
import '../ui/pages/auth/signin/bloc/login_bloc.dart';
import '../ui/pages/course_details/bloc/course_details_bloc.dart';
import '../ui/pages/home/bloc/session/session_bloc.dart';
import '../utils/SecureStorage.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //pattern singleton
  sl.registerLazySingleton(() => SecureStorage(storage:  sl()));
  sl.registerLazySingleton(() => AuthRepository(httpClient: sl(), secureStorage: sl()));

  // Core
  sl.registerLazySingleton(() =>
      AppHttpClient(baseUrl: AppConstants.BASE_URL, secureStorage: sl(), authBloc: sl()));

  // Repository
  sl.registerLazySingleton(() => ClassRoomRepository(httpClient: sl()));
  sl.registerLazySingleton(() => CourseRepository(httpClient: sl()));
  sl.registerLazySingleton(() => SessionRepository(httpClient: sl()));

  //Bloc Provider
  sl.registerLazySingleton(
      () => AuthenticationBloc(secureStorage: sl()));
  sl.registerLazySingleton(() => HomeBloc(courseRepository: sl(), secureStorage: sl()));
  sl.registerLazySingleton(() => SessionBloc(sessionRepository: sl()));
  sl.registerLazySingleton(() => LoginBloc(authenticationRepository: sl(), authenticationBloc: sl()));
  sl.registerLazySingleton(() => CourseDetailsBloc(courseRepository: sl()));


  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  const secureStorage =  FlutterSecureStorage();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => secureStorage);
}
