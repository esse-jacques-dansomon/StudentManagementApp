import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/blocs/session/session_bloc.dart';
import 'package:school_managment/route/app_routes.dart';
import 'package:school_managment/ui/pages/auth/bloc/auth_bloc.dart';
import 'package:school_managment/ui/pages/auth/signin.screen.dart';
import 'package:school_managment/ui/pages/home/bloc/home_bloc.dart';
import 'package:school_managment/ui/pages/splash_screen.dart';
import '../DI/DI.dart' as di;
import 'blocs/classroom/class_room_bloc.dart';

Future<void> main() async {
  // HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(create: (BuildContext context) => di.sl<AuthenticationBloc>()),
        BlocProvider<HomeBloc>(create: (BuildContext context) => di.sl<HomeBloc>()),
        BlocProvider<ClassRoomBloc>(create: (BuildContext context) => di.sl<ClassRoomBloc>()),
        BlocProvider<SessionBloc>(create: (BuildContext context) => di.sl<SessionBloc>()),
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
    return MaterialApp(
      title: 'School Management',
      theme: ThemeData(
        fontFamily: 'FuturaPT',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      // home: const SignInScreen(),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: true,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
