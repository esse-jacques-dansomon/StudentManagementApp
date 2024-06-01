import 'package:get_it/get_it.dart';
import 'package:school_managment/blocs/classroom/class_room_bloc.dart';
import 'package:school_managment/blocs/course/course_bloc.dart';
import 'package:school_managment/blocs/session/session_bloc.dart';
import 'package:school_managment/data/repositories/course.repo.dart';
import 'package:school_managment/data/repositories/session.repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_constantes.dart';
import '../data/datasource/AppHttpClient.dart';
import '../data/repositories/classrom.repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //pattern singleton

  // Core
  sl.registerLazySingleton(() => AppHttpClient(baseUrl:  AppConstants.BASE_URL, sharedPreferences:  sl()));

  // Repository
  sl.registerLazySingleton(() => ClassRoomRepository(httpClient:  sl()));
  sl.registerLazySingleton(() => CourseRepository(httpClient:  sl()));
  sl.registerLazySingleton(() => SessionRepository(httpClient:  sl()));

  //Bloc Provider
  sl.registerLazySingleton(() => ClassRoomBloc(classRoomRepository: sl()));
  sl.registerLazySingleton(() => CourseBloc(courseRepository :sl()));
  sl.registerLazySingleton(() => SessionBloc(sessionRepository:  sl()));


  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}