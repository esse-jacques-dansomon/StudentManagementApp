import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_managment/config/app_colors.dart';
import 'package:school_managment/ui/pages/home/widgets/Title_widget.dart';
import 'package:school_managment/ui/pages/home/widgets/course_card.dart';
import 'package:school_managment/ui/pages/home/widgets/serviceWidget.dart';
import 'package:school_managment/ui/pages/home/widgets/session_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
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
    } ,
    {
      'icon': Icons.my_library_books_outlined,
      'title': 'Results',
    },
    {
      'icon': Icons.directions_bus,
      'title': 'Transports',
    } ,
    {
      'icon': Icons.food_bank_outlined,
      'title': 'Fees',
    }
  ];
  @override
  Widget build(BuildContext context) {
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
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              //student card here with student details

              Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 150,
                  decoration: BoxDecoration(
                    color:  AppColors.PRIMARY,
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
                            child: Icon(Icons.person, color: Colors.black, size: 50,),
                          ),
                        ),
                        const SizedBox(width: 30,),
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
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                            const Text(
                              'Dayscholer',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 10,),
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
                                  child: const Center(child: Text("In", style: TextStyle(color: Colors.white),)),

                                ),
                                const SizedBox(width: 20,),
                                Container(
                                  width: 70,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                  ),
                                  child: const Center(child: Text("Out", style: TextStyle(),)),
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
                  padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8), // padding around the grid
                  itemCount:services.length, // total number of items
                  itemBuilder: (context, index) {
                    return  ServiceWidget(
                      isActive: index == 0,
                      title: services[index]['title'],
                      icon: services[index]['icon'],
                    );
                  },
                ),
              ),


              const SizedBox(height: 20),
              const SectionTitleWidget(title: "Courses of the Years"),
              ListView.builder(
                itemCount: services.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CourseCard(
                    title: services[index]['title'].toString(),
                    subtitle: 'CDSD - Digital Campus',
                    date: '25 May',
                  );
                },
              ),
              const SectionTitleWidget(title: "Courses in Progress"),
              ListView.builder(
                itemCount: services.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CourseCard(
                    title: services[index]['title'].toString(),
                    subtitle: 'CDSD - Digital Campus',
                    date: '25 May',
                  );
                },
              ),
              const SectionTitleWidget(title: "Daily class sessions"),
              ListView.builder(
                itemCount: services.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SessionCard(
                    title: services[index]['title'].toString(),
                    subtitle: 'CDSD - Digital Campus',
                    date: '25 May',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
