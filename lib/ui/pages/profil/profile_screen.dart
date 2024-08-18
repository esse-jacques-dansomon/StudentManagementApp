import 'package:flutter/material.dart';
import 'package:school_managment/config/app_colors.dart';
import 'package:school_managment/ui/pages/home/widgets/drawer_widget.dart';
import 'package:school_managment/ui/pages/profil/widgets/profil_item.dart';

import '../../base_widgets/app_bar/app_bar.dart';
import '../../base_widgets/bottom_bar/bottom_bar.dart';
import '../../base_widgets/cards/user_image_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return    Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      bottomNavigationBar: const AppBottomBar(currentIndex: 3,),
      body: SingleChildScrollView(
         child: Center(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               const Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(height: 20,),
                   UserImage(width:90, height:90),
                   SizedBox(height: 10,),
                   Text("Esse Jacques",
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   SizedBox(height: 5,),
                   Text("5th grade AWER3849042-2"),
                   SizedBox(height: 15,),
                 ],
               ),

               Container(
                 width: MediaQuery.of(context).size.width,
                 margin: const EdgeInsets.symmetric(horizontal: 20),
                 decoration: BoxDecoration(
                   color: Theme.of(context).colorScheme.tertiary,
                   borderRadius: BorderRadius.circular(10),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.black.withOpacity(0.1),
                       spreadRadius: 1,
                       blurRadius: 5,
                 ),
                   ],
                 ),
                 child: Column(
                   children: [
                     Container(
                       width: MediaQuery.of(context).size.width,
                       height: 45,
                       decoration: BoxDecoration(
                         backgroundBlendMode: BlendMode.darken,
                         color:AppColors.PRIMARY,
                         borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),
                         topRight: Radius.circular(10)
                         ),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.black.withOpacity(0.1),
                             spreadRadius: 1,
                 blurRadius: 5,
                           ),
                         ],
                       ),
                       child: const Center(
                         child: Text("Student Details",
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.w400,
                             color: Colors.white,
                           ),
                         ),
                       ),
                     ),
                     const Column(
                       children: [
                         SizedBox(height: 10,),

                         ProfileItem(
                           icon: Icons.calendar_month,
                           title: "Date of Birth",
                           titleValue: "25-05-2013",
                         ),
                         ProfileItem(
                           icon: Icons.people_alt_outlined,
                           title: "Gender",
                           titleValue: "Male",
                         ),
                         ProfileItem(
                           icon: Icons.bloodtype,
                           title: "Blood Type",
                           titleValue: "O+ Positive",
                         ),
                         ProfileItem(
                           icon: Icons.man,
                           title: "Father Name",
                           titleValue: "Jacob",
                         ),
                         ProfileItem(
                           icon: Icons.work,
                           title: "Occupation",
                           titleValue: "Graphic Designer",
                         ),
                         ProfileItem(
                           icon: Icons.phone,
                           title: "Phone",
                           titleValue: "72899373903",
                         ),
                         ProfileItem(
                           icon: Icons.email,
                           title: "Email",
                           titleValue: "hello@essejacques.co",
                         ),
                         ProfileItem(
                           icon: Icons.location_on,
                           title: "Address",
                           titleValue: "123 Main Street, New York, United States",
                         ),
                       ],
                     ),

                   ],
                 ),
               )


             ],
           ),
         ),
      ),
    );
  }
}
