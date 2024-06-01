import 'package:flutter/material.dart';
import 'package:school_managment/config/app_colors.dart';

class ServiceWidget extends StatelessWidget {
   final isActive  ;
   final  icon ;
   final  title ;
   const ServiceWidget({super.key, this.isActive = false, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: 80,
          width: 89,
          decoration: BoxDecoration(
            color: isActive ? AppColors.PRIMARY : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child:  Icon(icon ,color: isActive? Colors.white : AppColors.PRIMARY,size: 40,),
        ),
        SizedBox(height: 10,),
        Text(title)
      ],
    );
  }
}
