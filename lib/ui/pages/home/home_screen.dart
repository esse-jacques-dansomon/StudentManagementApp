import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/ui/base_widgets/app_bar/app_bar.dart';
import 'package:school_managment/ui/base_widgets/bottom_bar/bottom_bar.dart';
import 'package:school_managment/ui/base_widgets/cards/title.widget.dart';
import 'package:school_managment/ui/base_widgets/cards/course_card.widget.dart';
import 'package:school_managment/ui/base_widgets/cards/service_card.widget.dart';
import 'package:school_managment/ui/base_widgets/cards/session_card.widget.dart';
import 'package:school_managment/ui/base_widgets/shimmer/course_card_shimmer.dart';
import 'package:school_managment/ui/pages/auth/bloc/auth_bloc.dart';
import 'package:school_managment/ui/pages/home/widgets/drawer_widget.dart';
import 'package:school_managment/ui/pages/home/widgets/user_info.dart';

import 'bloc/home_bloc.dart';
import 'bloc/session/session_bloc.dart';

List<Map<String, Object>> services = [
  {
    'icon': Icons.note_alt_outlined,
    'title': 'Attendances',
  },
  {
    'icon': Icons.school,
    'title': 'Academic',
  },
  {
    'icon': Icons.calendar_month,
    'title': 'Timetable',
  },
  {
    'icon': Icons.menu_book,
    'title': 'Library',
  },
  {
    'icon': Icons.collections_bookmark_sharp,
    'title': 'Exam',
  },
  {
    'icon': Icons.my_library_books_outlined,
    'title': 'Results',
  },
  {
    'icon': Icons.directions_bus,
    'title': 'Transports',
  },
  {
    'icon': Icons.food_bank_outlined,
    'title': 'Fees',
  }
];
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBlocProvider = BlocProvider.of<HomeBloc>(context);
    final sessionBlocProvider = BlocProvider.of<SessionBloc>(context);

    return Scaffold(
       appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      bottomNavigationBar: const AppBottomBar(currentIndex: 0,),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            sessionBlocProvider
                .add(const GetClassRoomTodaySessions(classRoomId: 1));
            homeBlocProvider
                .add(const HomeLoadData(classroomId: 1, status: "PLANNED"));
          },
          child: SingleChildScrollView(
            padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [

                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticationLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is AuthenticationAuthenticated) {
                      return UserInfoWidget(
                        student: state.authResponse.student,
                      );
                    } else if (state is AuthenticationUnauthenticated) {
                      return const Center(
                        child: Text("Unauthenticated"),
                      );
                    } else if (state is AuthenticationUninitialized) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(); // Fallback if state is unrecognized or null
                  },
                ),


                const SectionTitleWidget(title: "Explore Services"),
                SizedBox(
                  height: 230,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // number of items in each row
                        mainAxisSpacing: 16.0, // spacing between rows
                        crossAxisSpacing: 16.0,
                        mainAxisExtent: 100
                      // spacing between columns
                    ),
                    padding:
                    const EdgeInsets.only(bottom: 0.0, left: 8, right: 8),
                    // padding around the grid
                    itemCount: services.length,
                    // total number of items
                    itemBuilder: (context, index) {
                      return ServiceWidget(
                        isActive: index == 0,
                        title: services[index]['title'],
                        icon: services[index]['icon'],
                      );
                    },
                  ),
                ),
                const SectionTitleWidget(title: "Daily class sessions"),

                BlocBuilder<SessionBloc, SessionState>(
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
                const SectionTitleWidget(title: "Courses of the Years"),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeDataLoading) {
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
                    } else if (state is HomeDataLoaded) {
                      return ListView.builder(
                        itemCount: state.courses.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CourseCard(
                            course: state.courses[index],
                          );
                        },
                      );
                    } else if (state is HomeDataError) {
                      return Center(child: Text(state.message));
                    } else {
                      return const Center(
                        child: Text("Course Loading"),
                      );
                    }
                  },
                ),
                const SectionTitleWidget(title: "Courses in Progress"),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeDataLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is HomeDataLoaded) {
                      return ListView.builder(
                        itemCount: state.courses.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CourseCard(
                            course: state.courses[index],
                          );
                        },
                      );
                    } else if (state is HomeDataError) {
                      return Center(child: Text(state.message));
                    } else {
                      return const Center(
                        child: Text("Course Loading"),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
