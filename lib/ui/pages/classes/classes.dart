import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:school_managment/ui/base_widgets/app_bar/app_bar.dart';

import '../../base_widgets/bottom_bar/bottom_bar.dart';
import '../../base_widgets/cards/session_card.widget.dart';
import '../../base_widgets/shimmer/course_card_shimmer.dart';
import '../home/bloc/session/session_bloc.dart';
import '../home/widgets/drawer_widget.dart';

class ClassesScreen extends StatefulWidget {
  const ClassesScreen({super.key});

  @override
  _ClassesScreenState createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {

  @override
  Widget build(BuildContext context) {
    final colorScheme  =  Theme.of(context).colorScheme;
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      bottomNavigationBar: const AppBottomBar(currentIndex: 2,),
      body:  Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            HorizontalWeekCalendar(
              minDate: DateTime.now().subtract(const Duration(days: 7)),
              maxDate: DateTime.now().add(const Duration(days: 7)),
              initialDate: DateTime.now(),
              onDateChange: (date) {
                setState(() {
                  //selectedDate = date;
                });
              },
              showTopNavbar: false,
              monthFormat: "MMMM yyyy",
              showNavigationButtons: false,
              weekStartFrom: WeekStartFrom.Monday,
              borderRadius: BorderRadius.circular(7),
              activeBackgroundColor: Colors.deepPurple,
              activeTextColor: Colors.white,
              inactiveBackgroundColor: Colors.deepPurple.withOpacity(.3),
              inactiveTextColor: Colors.white,
              disabledTextColor: Colors.grey,
              disabledBackgroundColor: Colors.grey.withOpacity(.3),
              activeNavigatorColor: Colors.deepPurple,
              inactiveNavigatorColor: Colors.grey,
              monthColor: Colors.deepPurple,
            ),
            const SizedBox(height: 20,),
            Flexible(
              child: SingleChildScrollView(
                child: BlocBuilder<SessionBloc, SessionState>(
                    builder: (context, state) {
                      if (state is SessionLoading) {
                        return ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return const Column(
                              children: [
                                CourseCardShimmer(),
                              ],
                            );
                          },
                        );
                      } else if (state is ClassRoomTodaySessionsLoad) {
                        return ListView.builder(
                          itemCount: state.sessions.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return SessionCard(
                              session: state.sessions[index],
                            );
                          },
                        );
                      } else if (state is SessionFailure) {
                        return Center(child: Text(state.message));
                      } else {
                        return const Center(child: Text("Something went wrong"));
                      }
                    },
                  ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
