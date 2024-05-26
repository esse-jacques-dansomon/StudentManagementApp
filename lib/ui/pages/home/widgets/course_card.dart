import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  const CourseCard({super.key, required this.title, required this.subtitle, required this.date});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 80,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 7, top: 7),
      child: Row(

        children: [
          const SizedBox(width: 10,),
          const SizedBox(
            height: 50,
            width: 60,
            child: Placeholder(),
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Text(
                  subtitle,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey),
                  ),
                ]),
          ),

          Text(
            date,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black),
          ),
          const SizedBox(width: 15,),

        ],
      ),
    );
  }
}
