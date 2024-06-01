import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/blocs/course/course_bloc.dart';
import 'package:school_managment/blocs/session/session_bloc.dart';
import 'package:school_managment/config/app_colors.dart';
import 'package:school_managment/ui/components/Title_widget.dart';
import 'package:school_managment/ui/components/course_card.dart';
import 'package:school_managment/ui/components/serviceWidget.dart';
import 'package:school_managment/ui/components/session_card.dart';

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
    final  courseBlocProvider= BlocProvider.of<CourseBloc>(context);
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
            courseBlocProvider.add( const GetClassroomCoursesByStatusEvent(classroomId: 1, status: "PLANNED"));
            courseBlocProvider.add( const GetClassroomCoursesEvent(classroomId: 1));
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
                const SizedBox(height: 20),
                const SectionTitleWidget(title: "Courses of the Years"),

                BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    if(state is ClassroomCoursesLoading){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if(state is ClassroomCoursesLoaded){
                      return ListView.builder(
                        itemCount:state.courses.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CourseCard(
                            title: state.courses[index].module,
                            subtitle:  state.courses[index].professor,
                            date: '25 May',
                          );
                        },
                      );
                    } else if (state is ClassroomCoursesError) {
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
                BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                   if(state is ClassroomCoursesByStatusLoading){
                     return const Center(
                       child: CircularProgressIndicator(),
                     );
                   } else if(state is ClassroomCoursesByStatusLoaded){
                    return ListView.builder(
                       itemCount: state.courses.length,
                       shrinkWrap: true,
                       physics: const NeverScrollableScrollPhysics(),
                       itemBuilder: (context, index) {
                         return CourseCard(
                           title: state.courses[index].module,
                           subtitle: state.courses[index].module,
                           date: '25 May',
                         );
                       },
                     );
                   } else if (state is ClassroomCoursesByStatusError) {
                     return Center(child: Text(state.message));
                   }
                   else {
                     return const Center(
                       child: Text("Course Loading"),
                     );
                   }
                  },
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
                            title: state.sessions[index].course.module,
                            subtitle: 'CDSD - Digital Campus',
                            date: '25 May',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
