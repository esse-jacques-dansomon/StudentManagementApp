import 'package:flutter/material.dart';
import 'package:school_managment/config/app_colors.dart';
import 'package:school_managment/data/models/course.model.dart';
import 'package:school_managment/ui/base_widgets/cards/course_card.widget.dart';


class SessionDetailsScreen extends StatefulWidget {
  const SessionDetailsScreen({super.key});

  @override
  State<SessionDetailsScreen> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<SessionDetailsScreen> {
  final text = "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum. Wikipédia";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PRIMARY,
        actions:  const [
           Text('Session Details',  style: TextStyle(color: Colors.white, fontSize: 20),),
           SizedBox(width: 20,)
        ],
        centerTitle: false,
        elevation: 10,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed: () => Navigator.of(context).pop(),),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 300,
              child: const Placeholder(),
            ),
            const SizedBox(height: 20,),
            const Text("UI/UX Fundamentals", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ),
                  child: const Center(
                    child: Text('Design', style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  width: 80,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ),
                  child: const Center(
                    child:  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_2_outlined, color: Colors.white, size: 23,),
                        SizedBox(width: 5,),
                        Text('10', style: TextStyle(color: Colors.white, fontSize: 18),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  width: 80,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ),
                  child: const Center(
                    child:  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month, color: Colors.white, size: 23,),
                        SizedBox(width: 5,),
                        Text('10', style: TextStyle(color: Colors.white, fontSize: 18),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const Text("About this Course", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text(text, style: TextStyle(color: Colors.grey.shade600, fontSize: 16),),
            const SizedBox(height: 10,),
            const Text("Sessions", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CourseCard(
                  course: Course(
                      status: "Panned",
                      professor: "Proffessor",
                      icon: "https://placehold.co/600x400/png" ,
                      module: "model",
                      id: index
                  ),

                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
