import 'package:flutter/material.dart';
import 'package:school_managment/route/app_routes.dart';
import 'package:school_managment/ui/pages/splash_screen.dart';

import 'config/app_colors.dart';

void main() {
  runApp(const MyApp());
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
      home: const SplashScreen(),
      debugShowCheckedModeBanner: true,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}