import 'package:flutter/material.dart';
import 'package:school_managment/config/app_colors.dart';
import 'package:school_managment/data/models/session.model.dart';
import 'package:school_managment/route/app_routes.dart';
import 'package:school_managment/ui/pages/course_details/course_details_screen.dart';

import '../../../config/app_constantes.dart';

class SessionCard extends StatelessWidget {
  final Session session;

  const SessionCard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      height: 80,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 7, top: 7),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 50,
            width: 60,
            child: Image(
              image: NetworkImage(session.course.icon),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    session.course.module,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                       ),
                  ),
                  Row(
                    children: [
                      Text(
                        session.course.professor,
                        style: const TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ]),
          ),
          Container(
            width: 70,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.PRIMARY,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  AppRoutes.navigateToWithArguments(context,
                      routeName: AppRoutes.sessionDetails,
                      arguments: session.course.id);
                },
                child: const Text("View",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
