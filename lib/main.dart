import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/route/app_routes.dart';
import 'package:school_managment/theme/theme_colors.dart';
import 'package:school_managment/ui/pages/auth/bloc/auth_bloc.dart';
import 'package:school_managment/ui/pages/auth/signin/bloc/login_bloc.dart';
import 'package:school_managment/ui/pages/auth/signin/signin.screen.dart';
import 'package:school_managment/ui/pages/course_details/bloc/course_details_bloc.dart';
import 'package:school_managment/ui/pages/home/bloc/home_bloc.dart';
import 'package:school_managment/ui/pages/home/bloc/session/session_bloc.dart';
import 'package:school_managment/ui/pages/home/home_screen.dart';
import 'package:school_managment/ui/pages/onboarding/on_boarding_screen.dart';
import 'package:school_managment/ui/pages/splash/splash_screen.dart';
import '../DI/DI.dart' as di;

Future<void> main() async {
  // HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
            create: (BuildContext context) =>
                di.sl<AuthenticationBloc>()..add(AppStarted())),
        BlocProvider<LoginBloc>(
            create: (BuildContext context) => di.sl<LoginBloc>()),
        BlocProvider<HomeBloc>(
            create: (BuildContext context) => di.sl<HomeBloc>()),
        BlocProvider<SessionBloc>(
            create: (BuildContext context) => di.sl<SessionBloc>()),
        BlocProvider<CourseDetailsBloc>(
            create: (BuildContext context) => di.sl<CourseDetailsBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final homeBlocProvider = BlocProvider.of<HomeBloc>(context);
    final sessionBlocProvider = BlocProvider.of<SessionBloc>(context);

    return MaterialApp(
      title: 'School',
      darkTheme: darkTheme,
      theme: lightTheme,
      home: BlocListener<AuthenticationBloc, AuthenticationState>(
         child: const SplashScreen(),
         listener: (context, state) {
        if (state is AuthenticationAuthenticated) {
          sessionBlocProvider
              .add(const GetClassRoomTodaySessions(classRoomId: 1));
          homeBlocProvider
              .add(const HomeLoadData(classroomId: 1, status: "PLANNED"));
        }
      }),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

