import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:school_managment/config/app_colors.dart';
import 'package:school_managment/route/app_routes.dart';

import '../auth/bloc/auth_bloc.dart';
import '../auth/signin/signin.screen.dart';
import '../home/bloc/home_bloc.dart';
import '../home/bloc/session/session_bloc.dart';
import '../home/home_screen.dart';
import '../onboarding/on_boarding_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final homeBlocProvider = BlocProvider.of<HomeBloc>(context);
    final sessionBlocProvider = BlocProvider.of<SessionBloc>(context);

    return AnimatedSplashScreen(
        splash: Column(
          children: [
            Expanded(child: Lottie.asset("assets/lotties/Animation-school.json"))
          ],
        ),
        duration: 500,
        backgroundColor: AppColors.PRIMARY,
        splashIconSize: 200,
        nextScreen: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationUnauthenticated) {
                return const SignInScreen();
              }
              else if (state is AuthenticationAuthenticated) {
                return const HomeScreen();
              }
              else if (state is AuthenticationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AuthenticationUninitialized) {
                return const Onboarding();
              }
              return const SplashScreen();
            }, listener: (context, state) {
          if (state is AuthenticationAuthenticated) {
            sessionBlocProvider
                .add(const GetClassRoomTodaySessions(classRoomId: 1));
            homeBlocProvider
                .add(const HomeLoadData(classroomId: 1, status: "PLANNED"));
          }
        }),
    );
  }
}
