import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String titleValue;
  const ProfileItem({super.key, required this.icon, required this.title, required this.titleValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(width: 10,),
          Text(title, style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
          )),
          const Spacer(),
          Container(
            alignment: Alignment.bottomRight,
            width: 155,
            child: Text(titleValue,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.clip
              ),

            ),
          ),
        ],
      ),
    );
  }
}
