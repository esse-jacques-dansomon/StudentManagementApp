import 'package:flutter/material.dart';
import 'package:school_managment/data/models/student.model.dart';

import '../../../../config/app_colors.dart';

class UserInfoWidget extends StatelessWidget {
  final Student? student;
  const UserInfoWidget({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return         Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        height: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
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
                   Text(
                     "${ student?.fullName()}",
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  // const SizedBox(height: 5),
                   Text(
                     "${student?.classRoom.level} - ${student?.classRoom.division}",
                    style: const TextStyle(
                        fontSize: 14, color: Colors.white),
                  ),
                  const Text(
                    'Dayscholer',
                    style: TextStyle(
                        fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
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
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        child: const Center(
                            child: Text(
                              "Out",
                            )),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(width: 10),
            ]));
  }
}
