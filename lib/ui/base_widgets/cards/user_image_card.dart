import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final double height ;
  final double width ;
  const UserImage({super.key,  this.height = 100, this.width=100});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height,
      width: width,
      child:  CircleAvatar(
        radius: 15,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.person,
          color: Colors.black,
          size: height - 10 ,
        ),
      ),
    );
  }
}
