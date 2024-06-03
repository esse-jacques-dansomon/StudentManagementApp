import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/blocs/session/session_bloc.dart';
import 'package:school_managment/config/app_colors.dart';
import 'package:school_managment/ui/base_widgets/cards/title.widget.dart';
import 'package:school_managment/ui/base_widgets/cards/course_card.widget.dart';
import 'package:school_managment/ui/base_widgets/cards/service_card.widget.dart';
import 'package:school_managment/ui/base_widgets/cards/session_card.widget.dart';
import 'package:school_managment/ui/base_widgets/shimmer/course_card_shimmer.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  //call when  is create
}

class _HomeScreenState extends State<HomeScreen> {



  List<Map<String, Object>> services = [
    {
      'icon': Icons.school,
      'title': 'Academic',
    },
    {
      'icon': Icons.note_alt_outlined,
      'title': 'Attendances',
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

  @override
  Widget build(BuildContext context) {
    final  homeBlocProvider= BlocProvider.of<HomeBloc>(context);
    final  sessionBlocProvider = BlocProvider.of<SessionBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PRIMARY,
        leadingWidth: double.infinity,
        leading: Container(
          margin: EdgeInsets.all(0),
          padding: const EdgeInsets.all(15),
          // decoration: BoxDecoration(
          //   color: Colors.blue,
          //   borderRadius: BorderRadius.circular(10),
          // ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(width: 10),
              Text('Esse Jacques',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.black.withOpacity(0.1),
              child: const Icon(Icons.search, color: Colors.white),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.black.withOpacity(0.1),
              child: const Icon(Icons.notifications, color: Colors.white),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: ( ) async{
            sessionBlocProvider.add(const GetClassRoomTodaySessions(classRoomId: 1));
            homeBlocProvider.add( const HomeLoadData(classroomId: 1, status: "PLANNED"));
          },
          child: SingleChildScrollView(
            padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                //student card here with student details

                Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 150,
                    decoration: BoxDecoration(
                      color: AppColors.PRIMARY,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 60,
                            width: 60,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 50,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Esse Jacques',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              // const SizedBox(height: 5),
                              const Text(
                                '5th grade | AE5156478955',
                                style:
                                TextStyle(fontSize: 14, color: Colors.white),
                              ),
                              const Text(
                                'Dayscholer',
                                style:
                                TextStyle(fontSize: 14, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.green,
                                    ),
                                    child: const Center(
                                        child: Text(
                                          "In",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 70,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                        child: Text(
                                          "Out",
                                          style: TextStyle(),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(width: 10),
                        ])),

                const SectionTitleWidget(title: "Explore Services"),
                SizedBox(
                  height: 250,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // number of items in each row
                        mainAxisSpacing: 16.0, // spacing between rows
                        crossAxisSpacing: 16.0,
                        mainAxisExtent: 130
                      // spacing between columns
                    ),
                    padding:
                    const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
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
                      return const Center(child: CircularProgressIndicator());
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
                    if(state is HomeDataLoading){
                      return  ListView.builder(
                        itemCount:3,
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
                    } else if(state is HomeDataLoaded){
                      return ListView.builder(
                        itemCount:state.courses.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CourseCard(
                           course: state.courses[index] ,
                          );
                        },
                      );
                    } else if (state is HomeDataError) {
                      return Center(child: Text(state.message));
                    }
                    else {
                      return const Center(
                        child: Text("Course Loading"),
                      );
                    }
                  },
                ),
                const SectionTitleWidget(title: "Courses in Progress"),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                   if(state is HomeDataLoading){
                     return const Center(
                       child: CircularProgressIndicator(),
                     );
                   } else if(state is HomeDataLoaded){
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
                   }
                   else {
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
