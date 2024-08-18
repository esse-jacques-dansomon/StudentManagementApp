import 'package:flutter/cupertino.dart';

class SectionTitleWidget extends StatelessWidget {
   final String title;
  const SectionTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
            alignment: Alignment.centerLeft,
            child:  Text(title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              textAlign: TextAlign.start,)),
        const SizedBox(height: 10),
      ],
    );
  }
}
