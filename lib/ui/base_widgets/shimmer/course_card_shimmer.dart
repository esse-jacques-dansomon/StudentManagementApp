import 'package:flutter/material.dart';
import 'package:school_managment/ui/base_widgets/shimmer/custom_shimmer.dart';

class CourseCardShimmer extends StatelessWidget {
  const CourseCardShimmer({super.key});

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
      child: const Row(
        children: [
           SizedBox(width: 10,),
          CustomShimmer(height: 50, width: 65, padding: 30,),
           SizedBox(width: 10,),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomShimmer(height: 20, padding: 10,),
                  SizedBox(height: 10,),
                  CustomShimmer(height: 20, padding: 10,),
                ]),
          ),
           SizedBox(width: 15,),
          CustomShimmer(height: 50, padding: 10,),
           SizedBox(width: 15,),

        ],
      ),
    );
  }
}
