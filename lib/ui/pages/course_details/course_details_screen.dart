import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/config/app_colors.dart';
import 'package:school_managment/data/models/course.model.dart';
import 'package:school_managment/ui/base_widgets/cards/course_card.widget.dart';
import 'package:school_managment/ui/pages/course_details/bloc/course_details_bloc.dart';
import 'package:school_managment/utils/string_extension.dart';

class SessionDetailsScreen extends StatelessWidget {
  final int courseId;

  const SessionDetailsScreen({super.key, required this.courseId});

  final text =
      "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum. Wikipédia";

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CourseDetailsBloc>(context)
      .add(GetCourseDetails(courseId));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PRIMARY,
        actions: const [
          Text(
            'Session Details',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            width: 20,
          )
        ],
        centerTitle: false,
        elevation: 10,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: BlocBuilder<CourseDetailsBloc, CourseDetailsState>(
          builder: (context, state) {
            if (state is CourseDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CourseDetailsError) {
              return Text(state.message);
            } else if (state is CourseDetailsLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 300,
                    width: double.infinity,
                    child: Image(
                      image: NetworkImage(state.courseDetails.icon),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    state.courseDetails.module,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 25,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black,
                        ),
                        child:  Center(
                          child: Text(
                           state.courseDetails.professor,
                            style: const TextStyle(color: Colors.white, fontSize: 18, ),

                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 25,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black,
                        ),
                        child:  Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                state.courseDetails.status.toTitleCase(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "About this Course",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Sessions",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    itemCount: state.courseDetails.sessions.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CourseCard(
                        course: Course(
                            status: state.courseDetails.sessions[index].status,
                            professor: state.courseDetails.professor,
                            icon: state.courseDetails.icon,
                            module: state.courseDetails.module + " - " + state.courseDetails.sessions[index].getDate(),
                            id: index),
                      );
                    },
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
