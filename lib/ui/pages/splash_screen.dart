import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/blocs/session/session_bloc.dart';
import 'package:school_managment/route/app_routes.dart';

import 'home/bloc/home_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final  courseBlocProvider= BlocProvider.of<HomeBloc>(context);
    final  sessionBlocProvider = BlocProvider.of<SessionBloc>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF10056B),
              Color(0xFF0661C2),
            ],
          ),
        ),
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text("Let's Boost Your \nSkills",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 20),
            const Text(
                "We are here to help you to boost \nyour skills and knowledge with our best services. \nLet's get started now!",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 20),
            //button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  sessionBlocProvider.add(const GetClassRoomTodaySessions(classRoomId: 1));
                  courseBlocProvider.add(const HomeLoadData(classroomId: 1, status: "PLANNED"));
                  AppRoutes.offAllAndGoTo(context, routeName: AppRoutes.signIn);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: const Text("Get Started",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ),
            const SizedBox(height: 30),


          ],
        ),
      ),
    );
  }
}
