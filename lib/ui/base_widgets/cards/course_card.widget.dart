import 'package:flutter/material.dart';
import 'package:school_managment/data/models/course.model.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
    )]
      ),
      height: 80,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 7, top: 7),
      child: Row(
        children: [
          const SizedBox(width: 10,),
           SizedBox(
            height: 50,
            width: 60,
              child: Image(
              image: NetworkImage(course.icon),
                fit: BoxFit.cover,
          ),),
          const SizedBox(width: 20,),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    course.module,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                  course.professor,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey),
                  ),
                ]),
          ),

          // Text(
          //   course.,
          //   style: const TextStyle(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: Colors.black),
          // ),
          const SizedBox(width: 15,),

        ],
      ),
    );
  }
}
